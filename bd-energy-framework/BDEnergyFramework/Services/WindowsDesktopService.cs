using BDEnergyFramework.Utils;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Management.Automation;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;
using ILogger = Serilog.ILogger;

namespace BDEnergyFramework.Services
{
    public class WindowsDesktopService : IDutService, IDisposable
    {
        private readonly IWifiService _wifiService;
        private readonly ILogger _logger;

        public WindowsDesktopService(IWifiService wifiService, ILogger logger)
        {
            _wifiService = wifiService;
            _logger = logger;
        }

        public void StopBackgroundProcesses()
        {
            _logger.Information("About to disable background processes");
            var ps = PowerShell.Create();

            foreach (var process in WindowsProcessesToStop())
            {
                try
                {
                    ps.AddCommand("Stop-Process").AddParameter("Name", process);
                    ps.Invoke();
                }
                catch (Exception)
                {
                    _logger.Warning("Unable to stop process '{name}'. Will continue...", process);
                }
            }
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

        public bool IsAdmin()
        {
            using (WindowsIdentity identity = WindowsIdentity.GetCurrent())
            {
                WindowsPrincipal principal = new WindowsPrincipal(identity);
                return principal.IsInRole(WindowsBuiltInRole.Administrator);
            }
        }

        public void Dispose()
        {
            EnableWifi();
        }

        public double GetTemperature()
        {
            return -1;
        }

        private static List<string> WindowsProcessesToStop()
        {
            return new List<string>()
            {
                "AsusUpdateCheck",
                "AsusDownLoadLicense",
                "msedge",
                "OneDrive",
                "GitHubDesktop",
                "Microsoft.Photos",
                "SkypeApp",
                "SkypeBackgroundHost",
                "SystemSettings",
                "TextInputHost",
                "msedge",
                "phoneexperiencehost",
                "runtimebroker",
                "searchapp",
            };
        }
    }
}
