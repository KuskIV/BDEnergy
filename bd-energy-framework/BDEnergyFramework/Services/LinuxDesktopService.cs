using BDEnergyFramework.Utils;

namespace BDEnergyFramework.Services;

public class LinuxDesktopService : IDutService
{
    public void DisableWifi()
    {
        LinuxUtils.ExecuteCommand("/bin/nmcli", "radio wifi off");
    }

    public void EnableWifi()
    {
        LinuxUtils.ExecuteCommand("/bin/nmcli", "radio wifi on");
    }

    public List<EMeasuringInstrument> GetMeasuringInstruments()
    {
        return new List<EMeasuringInstrument>()
        {
            EMeasuringInstrument.RAPL,
            EMeasuringInstrument.CLAMP
        };
    }

    public string GetOperatingSystem()
    {
        return Environment.OSVersion.Platform.ToString();
    }

    public double GetTemperature()
    {
        throw new NotImplementedException();
    }

    public bool IsAdmin()
    {
        throw new NotImplementedException();
    }

    public void StopBackgroundProcesses()
    {
        // Do nothing
    }
}