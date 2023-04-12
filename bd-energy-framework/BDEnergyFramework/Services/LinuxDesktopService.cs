using System.Net;
using BDEnergyFramework.Utils;

namespace BDEnergyFramework.Services;

public class LinuxDesktopService : IDutService
{
    private readonly string _machineName;
    private readonly string _wifiAdapterName;

    public LinuxDesktopService(string machineName, string wifiAdapterName)
    {
        _machineName = machineName;
        _wifiAdapterName = wifiAdapterName;
        // LinuxUtils.ExecuteCommandGetOutput("", "source ~/intel/oneapi/setvars.sh");
        // source ~/intel/oneapi/setvars.sh
    }
    
    public void DisableWifi()
    {
        LinuxUtils.ExecuteCommandAsSudo("/sbin/ifconfig", _wifiAdapterName + " down"); // enp0s31f6
    }

    public void EnableWifi()
    {
        LinuxUtils.ExecuteCommandAsSudo("/sbin/ifconfig", _wifiAdapterName + " up");
        
        while (!PingGoogleSuccessfully())
        {
            Thread.Sleep(TimeSpan.FromSeconds(3));
        }
    }

    public List<EMeasuringInstrument> GetMeasuringInstruments()
    {
        return new List<EMeasuringInstrument>()
        {
            EMeasuringInstrument.RAPL,
            EMeasuringInstrument.CLAMP,
            EMeasuringInstrument.PLUG
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
        else if (_machineName.Equals((DutUtils.WorkstationTwo)))
        {
            temperature = LinuxUtils.ExecuteCommandGetOutput("/bin/cat", "/sys/class/thermal/thermal_zone0/temp");
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
    
    private bool PingGoogleSuccessfully()
    {
        try
        {
            using (var client = new WebClient())
            using (var stream = client.OpenRead("http://www.google.com"))
            {
                return true;
            }
        }
        catch
        {
            return false;
        }
    }
}