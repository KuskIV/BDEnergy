namespace BDEnergyFramework.Models
{
    public record MeasurementConfiguration(
        List<EMeasuringInstrument> MeasurementInstruments,
        int RequiredMeasurements,
        int MeasurementsBetweenRestarts,
        List<string> TestCasePaths,
        List<int> AllocatedCores,
        List<string> TestCaseParameters,
        int BurnInPeriod,
        bool UploadToDatabase,
        bool DisableWifi,
        int MinimumTemperature,
        int MaximumTemperature,
        Dictionary<string, string> AdditionalMetadata)
    {
        public bool RequiresRestarts => MeasurementsBetweenRestarts > 0;
    }
}
