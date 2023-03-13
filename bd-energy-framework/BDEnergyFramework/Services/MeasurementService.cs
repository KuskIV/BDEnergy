﻿using BDEnergyFramework.MeasuringInstruments;
using BDEnergyFramework.Models;
using BDEnergyFramework.Models.Internal;
using BDEnergyFramework.Services.Repositories;
using BDEnergyFramework.Utils;
using Microsoft.Extensions.Logging;
using Mysqlx.Resultset;
using Polly;
using Polly.Retry;
using System.Data;
using System.Data.Common;
using System.Diagnostics;
using ILogger = Serilog.ILogger;

namespace BDEnergyFramework.Services
{
    public class MeasurementService : IMeasurementService
    {
        private readonly IDutService _dutService;
        private readonly Func<IDbConnection> _dbFactory;
        private readonly ILogger _logger;
        private readonly string _machineName;
        private readonly RetryPolicy _retryPolicy;
        private List<MeasuringInstrument> _measuringInstruments = new List<MeasuringInstrument>();
        private Dictionary<EMeasuringInstrument, int> _sampleRates;

        public MeasurementService(IDutService dutService, Func<IDbConnection> dbFactory, ILogger logger, string machineName)
        {
            _dutService = dutService;
            _dbFactory = dbFactory;
            _logger = logger;
            _machineName = machineName;
            _retryPolicy = Policy
                .Handle<AccessViolationException>()
                .Retry(3, (exception, retryCount) =>
                {
                    _logger.Warning("Exception of type {type} occured with message '{msg}'. Retrying... (attempt: {a})", exception.GetType(), exception.Message, retryCount);
                    //SetupMeasuringInstruments(config.MeasurementInstruments);
                });
        }

        public List<MeasurementContext> PerformMeasurement(MeasurementConfiguration config)
        {
            var measurements = new List<MeasurementContext>();
            var burninApplied = config.BurnInPeriod <= 0 ? true : false;


            if (burninApplied)
            {

                measurements = InitializeMeasurements(config, _machineName);
            }

            if (config.StopBackgroundProcesses)
            {
                _dutService.StopBackgroundProcesses();
            }

            if (burninApplied && !_measuringInstruments.Any())
            {
                _logger.Information("No measuring instruments were setup. Try again.");
                return new List<MeasurementContext>();
            }

            do
            {
                IntroduceMeasurement(config, measurements, burninApplied);

                if (CpuTooHotOrCold(config))
                {
                    Cooldown(config);
                }

                if (config.DisableWifi)
                {
                    _logger.Information("About to disable wifi");
                    _dutService.DisableWifi();
                }

                //PerformMeasurementsForAllConfigs(config, measurements);
                _retryPolicy.Execute(() => PerformMeasurementsForAllConfigs(config, measurements, burninApplied));

                if (burninApplied && config.UploadToDatabase)
                {
                    if (config.DisableWifi)
                    {
                        _logger.Information("About to enable wifi");
                        _dutService.EnableWifi();
                        _logger.Information("Successfully enabled wifi");
                    }

                    _logger.Information("Initializing db connection");
                    var repository = new MeasurementRepositoryHandler(_dbFactory, _logger);

                    repository.InsertLastMeasurements(measurements, config, _machineName, _sampleRates);
                    repository.Dispose();
                }

                if (!burninApplied && IsBurnInCountAchieved(measurements, config))
                {
                    measurements = InitializeMeasurements(config, _machineName);

                    burninApplied = true;
                }

            } while (!EnoughMeasurements(measurements, config, burninApplied));

            return measurements;
        }

        private List<MeasurementContext> InitializeMeasurements(MeasurementConfiguration config, string machineName)
        {
            _logger.Information("About to initialize measuring instruments");
            SetupMeasuringInstruments(config.MeasurementInstruments);
            _sampleRates = GetSampleRates();

            if (!config.UploadToDatabase)
            {
                return new List<MeasurementContext>();
            }

            _dutService.EnableWifi();

            var measurements = new List<MeasurementContext>();
            _logger.Information("Initializing db connection");
            var repository = new MeasurementRepositoryHandler(_dbFactory, _logger);


            foreach (var mi in config.MeasurementInstruments)
            {
                var sampleRate = _sampleRates[mi];

                foreach (var tc in config.TestCasePaths.Zip(config.TestCaseParameters))
                {
                    var testCase = PathUtils.GetFilenameFromPath(tc.First);
                    var parameter = tc.Second;

                    measurements.AddRange(
                        repository.GetMeasurements(mi, sampleRate, testCase, parameter, config, machineName)
                        );
                }
            }

            repository.Dispose();
            return measurements;
        }


        private Dictionary<EMeasuringInstrument, int> GetSampleRates()
        {
            return _measuringInstruments.ToDictionary(x => x.GetName(), y => y.GetMilisecondsBetweenSampels());
        }

        private void IntroduceMeasurement(MeasurementConfiguration config, List<MeasurementContext> measurements, bool burninApplied)
        {
            if (burninApplied)
            {
                _logger.Information("Performing measurement {cur}/{max}",
                    GetCurrentCount(measurements), config.RequiredMeasurements);
            }
            else
            {
                _logger.Information("Performing burnin {cur}/{max}",
                    GetCurrentCount(measurements), config.BurnInPeriod);
            }
        }

        private int GetCurrentCount(List<MeasurementContext> measurements)
        {
            if (!measurements.Any())
            {
                return 1;
            }

            return measurements.First().Measurements.Count() + 1;
        }

        private void PerformMeasurementsForAllConfigs(MeasurementConfiguration config, List<MeasurementContext> measurements, bool burninApplied)
        {
            foreach (var mi in config.MeasurementInstruments)
            {
                foreach (var tc in config.TestCasePaths.Zip(config.TestCaseParameters))
                {
                    if (!config.AllocatedCores.Any())
                    {
                        PerformMeasurementForConfig(config, measurements, mi, tc, new List<int>(), burninApplied);
                    }

                    foreach (var allocatedCores in config.AllocatedCores)
                    {
                        PerformMeasurementForConfig(config, measurements, mi, tc, allocatedCores, burninApplied);
                    }
                }
            }
        }

        private void PerformMeasurementForConfig(MeasurementConfiguration config, List<MeasurementContext> measurements, EMeasuringInstrument mi, (string First, string Second) tc, List<int> allocatedCores, bool burninApplied)
        {
            var testCasePath = tc.First;
            var testCaseParameter = tc.Second;

            _logger.Information("Executing and measuring using '{mi}' with input '{p} {testCaseParameter}', cores {cores}",
                mi, PathUtils.GetFilenameFromPath(testCasePath), testCaseParameter, string.Join(',', allocatedCores));

            SetupMeasurement(config, measurements, mi, testCaseParameter, testCasePath, allocatedCores);

            Measure(mi, testCaseParameter, testCasePath, measurements, allocatedCores, burninApplied);
        }

        private bool IsBurnInCountAchieved(List<MeasurementContext> measurements, MeasurementConfiguration config)
        {
            return measurements.All(x => x.Measurements.Count() >= config.BurnInPeriod);
        }

        private void Cooldown(MeasurementConfiguration config)
        {
            while (CpuTooHotOrCold(config))
            {
                _logger.Information("Sleeping for one minute while cooling down");
                Thread.Sleep(TimeSpan.FromMinutes(1));
            }
            
        }

        private bool CpuTooHotOrCold(MeasurementConfiguration config)
        {
            var temperature = _dutService.GetTemperature();

            var tooHotOrCold = temperature < config.MinimumTemperature || temperature > config.MaximumTemperature;

            if (tooHotOrCold)
            {
                _logger.Information("The temperature ({temperature}) is not between the accepted range between {minTemp} and {maxTemp}",
                    temperature, config.MinimumTemperature, config.MaximumTemperature);
            }

            return tooHotOrCold;
        }

        private bool EnoughMeasurements(List<MeasurementContext> measurements, MeasurementConfiguration config, bool burninApplied)
        {
            if (!burninApplied)
            {
                return false;
            }

            return measurements.Any() && measurements.All(x => x.Measurements.Count >= config.RequiredMeasurements);
        }

        private void Measure(EMeasuringInstrument mi, string testCaseParameter, string testCasePath, List<MeasurementContext> measurements, List<int> enabledCores, bool burninApplied)
        {
            var measuringInstrument = GetMeasuringInstrument(mi);
            var measurement = GetMeasurement(measurements, mi, testCasePath, testCaseParameter, enabledCores);

            var startTemperature = _dutService.GetTemperature();
            var startTime = DateTime.UtcNow;

            StartMeasuringInstrument(burninApplied, measuringInstrument, startTime);
            var stopWatch = Stopwatch.StartNew();

            ProcessUtils.ExecuteTestCaseWithParameters(testCaseParameter, testCasePath, enabledCores, _logger);

            stopWatch.Stop();
            StopMeasuringInstrument(burninApplied, measuringInstrument, startTime);

            var endTime = DateTime.UtcNow;
            var endTemperature = _dutService.GetTemperature();
            var iteration = GetIteration(measurements, mi, testCasePath, testCaseParameter, enabledCores);

            var (ts, m) = GetMeasurings(burninApplied, measuringInstrument, startTemperature, startTime, stopWatch, endTime, endTemperature, iteration);

            measurement.TimeSeries.Add(ts);
            measurement.Measurements.Add(m);

            _logger.Information("Test case exited after {duration} miliseconds", m.Duration);
        }

        private static (TimeSeries, Measurement) GetMeasurings(bool burninApplied, MeasuringInstrument? measuringInstrument, double startTemperature, DateTime startTime, Stopwatch stopWatch, DateTime endTime, double endTemperature, int iteration)
        {
            if (measuringInstrument is MeasuringInstrument mi)
            {
                return mi.GetMeasurement(startTime, endTime, stopWatch.ElapsedMilliseconds, startTemperature, endTemperature, iteration, burninApplied);
            }

            return (new TimeSeries(), new Measurement());
        }

        private void StartMeasuringInstrument(bool burninApplied, MeasuringInstrument? measuringInstrument, DateTime startTime)
        {
            if (!burninApplied)
            {
                return;
            }

            if (measuringInstrument is MeasuringInstrument mi)
            {
                mi.Start(startTime);
            }
            else
            {
                _logger.Warning("Measuring instrument was null when starting measuring");
            }
        }

        private void StopMeasuringInstrument(bool burninApplied, MeasuringInstrument? measuringInstrument, DateTime startTime)
        {
            if (!burninApplied)
            {
                return;
            }

            if (measuringInstrument is MeasuringInstrument mi)
            {
                mi.Stop(startTime);
            }
            else
            {
                _logger.Warning("Measuring instrument was null when starting measuring");
            }
        }

        private int GetIteration(List<MeasurementContext> measurement, EMeasuringInstrument mi, string testCasePath, string testCaseParameter, List<int> enabledCores)
        {
            var m = measurement.Where(x => 
                    x.MeasurementInstrument == mi && 
                    x.TestCase == PathUtils.GetFilenameFromPath(testCasePath) && 
                    x.Parameter == testCaseParameter &&
                    x.AllocatedCores.Count() == enabledCores.Count() &&
                    x.AllocatedCores.All(x => enabledCores.Contains(x)) &&
                    enabledCores.All(y => x.AllocatedCores.Contains(y)));

            return m.First().Measurements.Count() + 1;
        }



        private MeasurementContext GetMeasurement(List<MeasurementContext> measurements, EMeasuringInstrument mi, string testCasePath, string testCaseParameter, List<int> enabledCores)
        {
            return measurements.First(x =>
                x.Parameter == testCaseParameter &&
                x.TestCase == PathUtils.GetFilenameFromPath(testCasePath) &&
                x.MeasurementInstrument == mi &&
                x.AllocatedCores.Count() == enabledCores.Count() &&
                x.AllocatedCores.All(y => enabledCores.Contains(y)));
        }

        private MeasuringInstrument? GetMeasuringInstrument(EMeasuringInstrument mi)
        {
            return _measuringInstruments.FirstOrDefault(x => x.GetName() == mi);
        }

        private void SetupMeasuringInstruments(List<EMeasuringInstrument> measurementInstruments)
        {
            _measuringInstruments = measurementInstruments.Select(x => MeasuringInstrumentUtils.GetMeasuringInstrument(x, _logger)).ToList();
        }

        private void SetupMeasurement(MeasurementConfiguration config, List<MeasurementContext> measuremetns, EMeasuringInstrument mi, string testCaseParameter, string testCasePath, List<int> allocatedCores)
        {
            if (!MeasurementExists(measuremetns, mi, testCaseParameter, testCasePath, allocatedCores))
            {
                measuremetns.Add(
                    new MeasurementContext(testCasePath, testCaseParameter, mi, allocatedCores));
            }
        }

        private static bool MeasurementExists(List<MeasurementContext> measuremetns, EMeasuringInstrument mi, string testCaseParameter, string testCasePath, List<int> allocatedCores)
        {
            return measuremetns.Any(
                            x => x.Parameter == testCaseParameter &&
                            x.TestCase == PathUtils.GetFilenameFromPath(testCasePath) && 
                            x.MeasurementInstrument == mi &&
                            x.AllocatedCores.Count() == allocatedCores.Count() &&
                            x.AllocatedCores.All(y => allocatedCores.Contains(y)));
        }
    }
}
