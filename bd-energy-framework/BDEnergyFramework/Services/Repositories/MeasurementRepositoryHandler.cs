using BDEnergyFramework.Models;
using BDEnergyFramework.Models.Dto;
using BDEnergyFramework.Models.Internal;
using BDEnergyFramework.Utils;
using System.Data;
using ZstdNet;
using ILogger = Serilog.ILogger;

namespace BDEnergyFramework.Services.Repositories
{
    internal class MeasurementRepositoryHandler : IDisposable
    {
        private readonly MeasurementRepository _repository;
        private readonly ILogger _logger;

        public MeasurementRepositoryHandler(Func<IDbConnection> dbFactory, ILogger logger)
        {
            var connection = dbFactory();
            _repository = new MeasurementRepository(connection);
            _logger = logger;
        }

        public void Dispose()
        {
            _repository.Dispose();
        }

        internal void InsertLastMeasurements(List<MeasurementContext> measurements, MeasurementConfiguration config, string machineName)
        {
            var insertCount = 0;
            var maxCount = measurements.Count + 1;
            
            foreach (var m in measurements)
            {
                insertCount++;

                _logger.Information("Inserting measurement {cur}/{max}, test case {tc} measured by {mi}", insertCount, maxCount, PathUtils.GetFilenameFromPath(m.TestCase), m.MeasurementInstrument);

                var timeSeries = m.TimeSeries.Last();
                var measurement = m.Measurements.Last();

                var configId = GetConfigId(config);
                var testCaseId = GetTestCaseId(config, m.TestCase, m.Parameter);
                var dutId = GetDutId(config, machineName);
                var measurementInstrumentId = GetMeasurementInstrumentId(config, m.MeasurementInstrument);

                var collectionId = GetMeasurementCollectionId(
                    configId, testCaseId, dutId, measurementInstrumentId, config);

                InsertTimeSeries(timeSeries, collectionId);
                InsertMeasurement(measurement, collectionId);

            }
        }

        private void InsertMeasurement(Measurement measurement, int collectionId)
        {
            _logger.Debug("Inserting measurement");

            _repository.InsertMeasurement(measurement, collectionId);
        }

        private void InsertTimeSeries(TimeSeries timeSeries, int collectionId)
        {
            _logger.Debug("Inserting timeseries with {p} points", timeSeries.Sampels.Count());

            foreach (var t in timeSeries.Sampels)
            {
                _repository.InsertTimeseries(t, collectionId);
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

        private int GetMeasurementInstrumentId(MeasurementConfiguration config, EMeasuringInstrument measurementInstrument)
        {
            var measuringInstrument = Mapper.Map(measurementInstrument);

            if (!_repository.MeasuringInstrumentExists(measurementInstrument))
            {
                _logger.Debug("Inserting new measurement instrument '{name}'", measurementInstrument);

                _repository.InsertMeasuringInstrument(measurementInstrument);
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
            var dut = Mapper.Map(configId, machineName);

            if (!_repository.DutExists(dut))
            {
                _logger.Debug("Inserting new dut '{name}' '{os}'", dut.Name, dut.Os);

                _repository.InsertDut(dut);
            }
            else
            {
                _logger.Debug("DUT '{name}' '{os}' already existed", dut.Name, dut.Os);
            }

            _logger.Debug("Requesting DUT...");

            var dtoDut = _repository.GetDut(dut);

            _logger.Debug("Successfully fetched DUT with id {id}", dtoDut.Id);


            return dtoDut.Id;
        }

        private int GetTestCaseId(MeasurementConfiguration config, string testCasePath, string parameter)
        {
            var testCase = Mapper.Map(config, testCasePath, parameter);

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

        private int GetConfigId(MeasurementConfiguration measurementConfiguration)
        {
            var configuration = Mapper.Map(measurementConfiguration);

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
    }
}
