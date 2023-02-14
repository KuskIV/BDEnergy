namespace BDEnergyFramework.Services
{
    public interface IDutService
    {
        List<string> GetMeasuringInstruments();
        string GetOperatingSystem();
    }
}