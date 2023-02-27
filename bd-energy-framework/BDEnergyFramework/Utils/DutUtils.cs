using BDEnergyFramework.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.Utils
{
    public static class DutUtils
    {
        public static IDutService GetDutService(Models.UserSecrets secrets)
        {
            if (IsWindowsMachine())
            {
                var wifiService = new WifiService(secrets.WifiAdapterName);

                return new WindowsDesktopService(wifiService);
            }

            throw new NotImplementedException($"The OS {Environment.OSVersion.Platform.ToString()} is not implemented");
        }

        public static string GetOperatingSystem()
        {
            return Environment.OSVersion.Platform.ToString();
        }

        private static bool IsWindowsMachine()
        {
            return Environment.OSVersion.Platform == PlatformID.Win32NT;
        }
    }
}
