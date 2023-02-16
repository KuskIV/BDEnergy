using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.Services
{
    public class WifiService : IWifiService
    {
        private readonly string _wifiAdapterName;

        public WifiService(string wifiAdapterName)
        {
            _wifiAdapterName = wifiAdapterName;
        }

        public void EnableWifi()
        {
            ProcessStartInfo psi = new ProcessStartInfo("netsh", "interface set interface \"" + _wifiAdapterName + "\" enable");
            Process p = new Process();
            p.StartInfo = psi;
            p.Start();

            while (!PingGoogleSuccessfully())
            {
                Thread.Sleep(TimeSpan.FromSeconds(3));
            }
        }

        public void DisableWifi()
        {
            ProcessStartInfo psi = new ProcessStartInfo("netsh", "interface set interface \"" + _wifiAdapterName + "\" disable");
            Process p = new Process();
            p.StartInfo = psi;
            p.Start();
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

        private async Task IsWifiEnabled()
        {
            while (!PingGoogleSuccessfully())
            {
                await Task.Delay(TimeSpan.FromSeconds(3));
            }
        }
    }
}
