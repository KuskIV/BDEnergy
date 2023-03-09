using BDEnergyFramework.Models;
using BDEnergyFramework.Models.Dto;
using BDEnergyFramework.Models.Internal;

namespace BDEnergyFramework.Services.Repositories
{
    public interface IMeasurementRepository
    {
        bool ConfigExists(Configuration configuration);
        void Dispose();
        bool DutExists(DeviceUnderTest dut);
        DtoConfiguration GetConfiguration(Configuration configuration);
        DtoDeviceUnderTest GetDut(DeviceUnderTest dut);
        DtoMeasurementCollection GetMeasurementCollection(MeasurementCollection mc);
        DtoMeasurementInstrument GetMeasuringInstrument(MeasurementInstrument measuringInstrument);
        DtoTestCase GetTestCase(TestCase tc);
        void InsertConfiguration(Configuration c);
        void InsertDut(DeviceUnderTest dut);
        void InsertMeasurement(Measurement m, int collectionId);
        void InsertMeasurementCollection(MeasurementCollection mc);
        void InsertMeasuringInstrument(MeasurementInstrument measurementInstrument);
        void InsertTestCase(TestCase tc);
        void InsertTimeseries(Sample t, int collectionId, int measurementId);
        bool MeasurementCollectionExists(MeasurementCollection mc);
        bool MeasuringInstrumentExists(MeasurementInstrument mi);
        bool TestCaseExists(TestCase testCase);
    }
}