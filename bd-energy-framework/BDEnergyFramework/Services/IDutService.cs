namespace BDEnergyFramework.Services
{
    public interface IDutService
    {
        void DisableWifi();
        void EnableWifi();
        List<EMeasuringInstrument> GetMeasuringInstruments();
        string GetOperatingSystem();
        double GetTemperature();
        bool IsAdmin();
        void StopBackgroundProcesses();
    }
}