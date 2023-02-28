namespace BDEnergyFramework.Models
{
    public record MeasurementConfiguration(
        List<EMeasuringInstrument> MeasurementInstruments,
        int RequiredMeasurements,
        List<string> TestCasePaths,
        List<List<int>> AllocatedCores,
        List<string> TestCaseParameters,
        int BurnInPeriod,
        bool UploadToDatabase,
        bool DisableWifi,
        int MinimumTemperature,
        int MaximumTemperature,
        int ExperimentNumber,
        string ExperimentName,
        string ConcurrencyLimit,
        string TestCaseType,
        string Compiler,
        string Optimizations,
        string Language,
        bool StopBackgroundProcesses,
        Dictionary<string, string> AdditionalMetadata);
}
