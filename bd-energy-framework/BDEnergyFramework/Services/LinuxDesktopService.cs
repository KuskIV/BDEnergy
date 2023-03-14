using BDEnergyFramework.Utils;

namespace BDEnergyFramework.Services;

public class LinuxDesktopService : IDutService
{
    private readonly string _machineName;

    public LinuxDesktopService(string machineName)
    {
        _machineName = machineName;
    }
    
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
        var temperature = 0f;
        
        if (_machineName.Equals(DutUtils.WorkstationOne))
        {
            temperature = LinuxUtils.ExecuteCommandGetOutput("/bin/cat", "/sys/class/thermal/thermal_zone1/temp");
        }
        else
        {
            throw new NotImplementedException("Device is not supported to get temperature from");
        }
        
        return temperature / 1000;
    }

    public bool IsAdmin()
    {
        throw new NotImplementedException("IsAdmin is not implemented on linux");
    }

    public void StopBackgroundProcesses()
    {
        // Do nothing
    }
}