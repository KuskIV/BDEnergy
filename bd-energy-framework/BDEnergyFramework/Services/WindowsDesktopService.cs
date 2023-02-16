using BDEnergyFramework.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.Services
{
    public class WindowsDesktopService : IDutService, IDisposable
    {
        private readonly IWifiService _wifiService;

        public WindowsDesktopService(IWifiService wifiService)
        {
            _wifiService = wifiService;
        }

        public string GetOperatingSystem()
        {
            return Environment.OSVersion.Platform.ToString();
        }

        public List<EMeasuringInstrument> GetMeasuringInstruments()
        {
            return new List<EMeasuringInstrument>()
            {
                EMeasuringInstrument.IPG,
                EMeasuringInstrument.LHM
            };
        }

        public void DisableWifi()
        {
            _wifiService.DisableWifi();
        }

        public void EnableWifi()
        {
            _wifiService.EnableWifi();
        }

        public void Dispose()
        {
            EnableWifi();
        }

        public double GetTemperature()
        {
            return WindowsTemperatureReader.GetCpuTemperature();
        }
    }
}
