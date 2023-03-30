using BDEnergyFramework.Models;
using BDEnergyFramework.Models.Dto;
using BDEnergyFramework.Models.Internal;
using BDEnergyFramework.Utils;
using Polly;
using Polly.Retry;
using System.Data;
using ILogger = Serilog.ILogger;

namespace BDEnergyFramework.Services.Repositories
{
    internal class MeasurementRepositoryHandler : IDisposable
    {
        private readonly MeasurementRepository _repository;
        private readonly ILogger _logger;
        private RetryPolicy _retryPolicy;

        public MeasurementRepositoryHandler(Func<IDbConnection> dbFactory, ILogger logger)
        {
            _retryPolicy = Policy
                .Handle<Exception>()
                .WaitAndRetry(100, retryAttempt => TimeSpan.FromSeconds(Math.Pow(2, retryAttempt)));

            var connection = _retryPolicy.Execute(() => dbFactory());
            _repository = new MeasurementRepository(connection);
            _logger = logger;
        }

        public void Dispose()
        {
            _repository.Dispose();
        }

        internal void InsertLastMeasurements(List<MeasurementContext> measurements, MeasurementConfiguration config, string machineName, Dictionary<EMeasuringInstrument, int> sampleRates)
        {
            var insertCount = 0;
            var maxCount = measurements.Count;
            
            foreach (var m in measurements)
            {
                insertCount++;

                _logger.Information("Inserting measurement {cur}/{max}, test case {tc} measured by {mi}", insertCount, maxCount, PathUtils.GetFilenameFromPath(m.TestCase), m.MeasurementInstrument);

                if (m is null || (m is { } mc  && !mc.Measurements.Any()))
                {
                    _logger.Information("No measurements were found to upload");
                    continue;
                }

                var timeSeries = m.TimeSeries.Last();
                var measurement = m.Measurements.Last();

                if (!measurement.HasBeenSaved)
                {
                    var sampleRate = sampleRates[m.MeasurementInstrument];

                    var configId = GetConfigId(config, m.AllocatedCores);
                    var testCaseId = GetTestCaseId(config, m.TestCase, m.Parameter);
                    var dutId = GetDutId(config, machineName);
                    var measurementInstrumentId = GetMeasurementInstrumentId(config, m.MeasurementInstrument, sampleRate);

                    var collectionId = GetMeasurementCollectionId(
                        configId, testCaseId, dutId, measurementInstrumentId, config);

                    InsertMeasurement(measurement, collectionId);
                    var measurementId = GetMeasurementId(measurement, collectionId);
                    InsertTimeSeries(timeSeries, collectionId, measurementId);
                    measurement.HasBeenSaved = true;
                }
                else
                {
                    _logger.Information("Measurement for {mi} already inserted", m.MeasurementInstrument);
                }
            }
        }

        private int GetMeasurementId(Measurement measurement, int collectionId)
        {
            return _repository.GetMeasurementId(measurement, collectionId);
        }

        private void InsertMeasurement(Measurement measurement, int collectionId)
        {
            _logger.Debug("Inserting measurement");

            _repository.InsertMeasurement(measurement, collectionId);
        }

        private void InsertTimeSeries(TimeSeries timeSeries, int collectionId, int measurementId)
        {
            _logger.Debug("Inserting timeseries with {p} points", timeSeries.Sampels.Count());

            foreach (var t in timeSeries.Sampels)
            {
                _repository.InsertTimeseries(t, collectionId, measurementId);
            }
        }

        private int GetMeasurementCollectionId(int configId, int testCaseId, int dutId, int measurementInstrumentId, MeasurementConfiguration config)
        {
            var measurementCollection = Mapper.Map(configId, testCaseId, dutId, measurementInstrumentId, config);

            if (!_repository.MeasurementCollectionExists(measurementCollection))
            {
                _logger.Debug("Inserting new measurement collection");

                _repository.InsertMeasurementCollection(measurementCollection);
            }
            else
            {
                _logger.Debug("Measurement collection already existed");
            }

            _logger.Debug("Requesting measurement collection...");

            var dtoMeasurementCollection = _repository.GetMeasurementCollection(measurementCollection);

            _logger.Debug("Successfully fetched measurenemt collection with id {id}", dtoMeasurementCollection.Id);

            return dtoMeasurementCollection.Id;
        }

        private int GetMeasurementInstrumentId(MeasurementConfiguration config, EMeasuringInstrument measurementInstrument, int sampleRate)
        {
            var measuringInstrument = Mapper.Map(measurementInstrument, sampleRate);

            if (!_repository.MeasuringInstrumentExists(measuringInstrument))
            {
                _logger.Debug("Inserting new measurement instrument '{name}'", measurementInstrument);

                _repository.InsertMeasuringInstrument(measuringInstrument);
            }
            else
            {
                _logger.Debug("Measurement instrument '{name}' already existed", measurementInstrument);
            }

            _logger.Debug("Requesting measurement instrument...");

            var dtoMeasuringInstrument = _repository.GetMeasuringInstrument(measuringInstrument);

            _logger.Debug("Successfully fetched measurenemt instrument with id {id}", dtoMeasuringInstrument.Id);

            return dtoMeasuringInstrument.Id;
        }

        private int GetDutId(MeasurementConfiguration configId, string machineName)
        {
            var env = DutUtils.GetEnv();
            var dut = Mapper.MapToDut(configId, machineName, env);

            if (!_repository.DutExists(dut))
            {
                _logger.Debug("Inserting new dut '{name}' '{os}' '{env}'", dut.Name, dut.Os, dut.Env);

                _repository.InsertDut(dut);
            }
            else
            {
                _logger.Debug("DUT '{name}' '{os}' '{env}' already existed", dut.Name, dut.Os, dut.Env);
            }

            _logger.Debug("Requesting DUT...");

            var dtoDut = _repository.GetDut(dut);

            _logger.Debug("Successfully fetched DUT with id {id}", dtoDut.Id);


            return dtoDut.Id;
        }

        private int GetTestCaseId(MeasurementConfiguration config, string testCasePath, string parameter)
        {
            var testCase = Mapper.Map(config, testCasePath, parameter);

            if (!testCase.Name.EndsWith(".exe"))
            {
                testCase.Name = testCase.Name + ".exe";
            }
            
            if (!_repository.TestCaseExists(testCase))
            {
                _logger.Debug("Inserting new test case '{tc} {parameter}'", testCase.Name, testCase.Parameter);

                _repository.InsertTestCase(testCase);
            }
            else
            {
                _logger.Debug("Test case '{tc} {parameter}' already existed", testCase.Name, testCase.Parameter);
            }

            _logger.Debug("Requesting test case...");

            var dtoTestCase = _repository.GetTestCase(testCase);

            _logger.Debug("Successfully fetched test case with id {id}", dtoTestCase.Id);


            return dtoTestCase.Id;
        }

        private int GetConfigId(MeasurementConfiguration measurementConfiguration, List<int> allocatedCores)
        {
            var configuration = Mapper.Map(measurementConfiguration, allocatedCores);

            if (!_repository.ConfigExists(configuration))
            {
                _logger.Debug("Inserting new configuration");
                _repository.InsertConfiguration(configuration);
            }
            else
            {
                _logger.Debug("Configuration already existed");
            }

            _logger.Debug("Requesting configuration...");

            var dtoConfig = _repository.GetConfiguration(configuration);

            _logger.Debug("Successfully fetched config with id {id}", dtoConfig.Id);

            return dtoConfig.Id;
        }

        internal IEnumerable<MeasurementContext> GetMeasurements(EMeasuringInstrument mi, int sampleRate, string testCaseName, string parameter, MeasurementConfiguration config, string machineName)
        {
            var measurements = new List<MeasurementContext>();

            var dut = GetDutId(config, machineName);
            var measurementInstrument = GetMeasurementInstrumentId(config, mi, sampleRate);
            var testCase = GetTestCaseId(config, testCaseName, parameter);

            if (!config.AllocatedCores.Any())
            {
                var measurement = new MeasurementContext(testCaseName, parameter, mi, new List<int>());

                measurement.Measurements.AddRange(
                    GetMeasurements(config, dut, measurementInstrument, testCase, new List<int>())
                    );

                measurements.Add(measurement);
            }

            foreach (var allocatedCore in config.AllocatedCores)
            {
                var measurement = new MeasurementContext(testCaseName, parameter, mi, allocatedCore);

                measurement.Measurements.AddRange(
                    GetMeasurements(config, dut, measurementInstrument, testCase, allocatedCore)
                    );

                measurements.Add(measurement);
            }

            return measurements;
        }

        private IEnumerable<Measurement> GetMeasurements(MeasurementConfiguration config, int dut, int measurementInstrument, int testCase, List<int> allocatedCore)
        {
            var configuration = GetConfigId(config, allocatedCore);

            var measurementCollection = GetMeasurementCollectionId(configuration, testCase, dut, measurementInstrument, config);

            return _repository.GetMeasurements(measurementCollection);
        }
    }
}
