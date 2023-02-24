using BDEnergyFramework.MeasuringInstruments;
using BDEnergyFramework.Models;
using BDEnergyFramework.Services.Repositories;
using BDEnergyFramework.Utils;
using Microsoft.Extensions.Logging;
using System.Data.Common;
using System.Diagnostics;
using ILogger = Serilog.ILogger;

namespace BDEnergyFramework.Services
{
    public class MeasurementService : IMeasurementService
    {
        private readonly IDutService _dutService;
        private readonly Func<DbConnection> _dbFactory;
        private readonly ILogger _logger;
        private List<MeasuringInstrument> _measuringInstruments = new List<MeasuringInstrument>();

        public MeasurementService(IDutService dutService, Func<DbConnection> dbFactory, ILogger logger)
        {
            _dutService = dutService;
            _dbFactory = dbFactory;
            _logger = logger;
        }

        public List<MeasurementContext> PerformMeasurement(MeasurementConfiguration config)
        {
            var measurements = new List<MeasurementContext>();
            var burninApplied = config.BurnInPeriod <= 0 ? true : false;

            SetupMeasuringInstruments(config.MeasurementInstruments);

            if (!_measuringInstruments.Any())
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

                PerformMeasurementsForAllConfigs(config, measurements);

                if (!burninApplied && IsBurnInCountAchieved(measurements, config))
                {
                    measurements = new List<MeasurementContext>();
                    burninApplied = true;
                }


            } while (!EnoughMeasurements(measurements, config, burninApplied));

            if (config.UploadToDatabase)
            {
                _logger.Information("Initializing db connection");
                var repository = new MeasurementRepository();

                repository.InsertMeasurements(measurements);
            }

            return measurements;
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

        private object GetCurrentCount(List<MeasurementContext> measurements)
        {
            if (!measurements.Any())
            {
                return 1;
            }

            return measurements.First().Measurements.Count() + 1;
        }

        private void PerformMeasurementsForAllConfigs(MeasurementConfiguration config, List<MeasurementContext> measurements)
        {
            foreach (var mi in config.MeasurementInstruments)
            {
                foreach (var tc in config.TestCasePaths.Zip(config.TestCaseParameters))
                {
                    var testCasePath = tc.First;
                    var testCaseParameter = tc.Second;

                    _logger.Information("Executing and measuring using '{mi}' with input '{p} {testCaseParameter}'",
                        mi, PathUtils.GetFilenameFromPath(testCasePath), testCaseParameter);

                    SetupMeasurement(config, measurements, mi, testCaseParameter, testCasePath);

                    Measure(mi, testCaseParameter, testCasePath, measurements, config.AllocatedCores);

                    EndMeasurement(config);
                }
            }
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

        private void Measure(EMeasuringInstrument mi, string testCaseParameter, string testCasePath, List<MeasurementContext> measurements, List<int> enabledCores)
        {
            var measuringInstrument = GetMeasuringInstrument(mi);
            var measurement = GetMeasurement(measurements, mi, testCasePath, testCaseParameter);

            var startTime = DateTime.UtcNow;
            var stopWatch = Stopwatch.StartNew();

            measuringInstrument.Start(startTime);
            
            ExecuteTestCaseWithParameters(testCaseParameter, testCasePath, enabledCores);

            measuringInstrument.Stop(startTime);
            stopWatch.Stop();
            var endTime = DateTime.UtcNow;

            var (ts, m) = measuringInstrument.GetMeasurement(startTime, endTime, stopWatch.ElapsedMilliseconds);

            measurement.TimeSeries.Add(ts);
            measurement.Measurements.Add(m);
        }

        private void ExecuteTestCaseWithParameters(string testCaseParameter, string testCasePath, List<int> enabledCores)
        {
            var executablePath = testCasePath;
            var parameters = testCaseParameter;

            var process = new Process();
            process.StartInfo.FileName = "\"" + executablePath + "\"";
            process.StartInfo.Arguments = parameters;
            process.StartInfo.UseShellExecute = false;
            process.StartInfo.RedirectStandardOutput = true;
            process.Start();
            process.PriorityClass= ProcessPriorityClass.High;

            if (enabledCores.Any())
            {
                var processorAffinity = ProcessorAffinityGenerator.GenerateProcessorAffinity(enabledCores);
                process.ProcessorAffinity = processorAffinity;
            }

            process.WaitForExit();

            // Get the exit code of the process
            var exitCode = process.ExitCode;

            _logger.Information("Test case '{tc}' exited with exit code '{exitCode}'",
                PathUtils.GetFilenameFromPath(testCasePath), exitCode);
        }

        private MeasurementContext GetMeasurement(List<MeasurementContext> measurements, EMeasuringInstrument mi, string testCasePath, string testCaseParameter)
        {
            return measurements.First(x => 
                x.Parameter == testCaseParameter && 
                x.TestCase == testCasePath && 
                x.MeasurementInstrument == mi);
        }

        private MeasuringInstrument GetMeasuringInstrument(EMeasuringInstrument mi)
        {
            return _measuringInstruments.First(x => x.GetName() == mi);
        }

        private void SetupMeasuringInstruments(List<EMeasuringInstrument> measurementInstruments)
        {
            _measuringInstruments = measurementInstruments.Select(x => MeasuringInstrumentUtils.GetMeasuringInstrument(x)).ToList();
        }

        private void SetupMeasurement(MeasurementConfiguration config, List<MeasurementContext> measuremetns, EMeasuringInstrument mi, string testCaseParameter, string testCasePath)
        {
            if (!MeasurementExists(measuremetns, mi, testCaseParameter, testCasePath))
            {
                measuremetns.Add(
                    new MeasurementContext(testCasePath, testCaseParameter, mi));
            }

            if (config.DisableWifi)
            {
                _logger.Information("About to disable wifi");
                _dutService.DisableWifi();
            }
        }

        private void EndMeasurement(MeasurementConfiguration config)
        {
            if (config.DisableWifi)
            {
                _logger.Information("About to enable wifi");

                _dutService.EnableWifi();
                
                _logger.Information("Wifi successfully enabled");
            }
        }

        private static bool MeasurementExists(List<MeasurementContext> measuremetns, EMeasuringInstrument mi, string testCaseParameter, string testCasePath)
        {
            return measuremetns.Any(
                            x => x.Parameter == testCaseParameter &&
                            x.TestCase == testCasePath
                            && x.MeasurementInstrument == mi);
        }
    }
}
