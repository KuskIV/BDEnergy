namespace BDEnergyFramework.Models
{
    public record MeasurementCollectionConfiguration(
        List<string> MeasurementInstruments,
        int RequiredMeasurements,
        int MeasurementsBetweenRestarts,
        List<string> TestCasePaths,
        int AllocatedCores,
        List<string> TestCaseParameters,
        Dictionary<string, string> AdditionalMetadata)
    {
        public bool RequiresRestarts => MeasurementsBetweenRestarts > 0;
    }
}
