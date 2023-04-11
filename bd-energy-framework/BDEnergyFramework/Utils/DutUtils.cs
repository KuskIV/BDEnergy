using BDEnergyFramework.Services;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using ILogger = Serilog.ILogger;

namespace BDEnergyFramework.Utils
{
    public static class DutUtils
    {
        public const string WorkstationOne = "WorkstationOne";
        public const string WorkstationTwo = "WorkstationTwo";

        public static IDutService GetDutService(Models.UserSecrets secrets, ILogger logger)
        {
            if (IsWindowsMachine())
            {
                var wifiService = new WifiService(secrets.WifiAdapterName);

                return new WindowsDesktopService(wifiService, logger);
            }

            if (IsLinuxMachine())
            {
                return new LinuxDesktopService(secrets.MachineName, secrets.WifiAdapterName);
            }

            throw new NotImplementedException($"The OS {Environment.OSVersion.Platform.ToString()} is not implemented");
        }

        public static string GetOperatingSystem()
        {
            return Environment.OSVersion.Platform.ToString();
        }

        public static string GetEnv()
        {
#if DEBUG
            return "DEV";
#else
            return "PROD";
#endif
        }

        internal static bool IsWindows()
        {
            return IsWindowsMachine();
        }

        private static bool IsWindowsMachine()
        {
            return Environment.OSVersion.Platform == PlatformID.Win32NT;
        }
        
        public static bool IsLinuxMachine()
        {
            return Environment.OSVersion.Platform == PlatformID.Unix;
        }
    }
}
