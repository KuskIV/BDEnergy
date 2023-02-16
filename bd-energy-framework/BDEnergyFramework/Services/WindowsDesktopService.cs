using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.Services
{
    public class WindowsDesktopService : IDutService
    {
        public string GetOperatingSystem()
        {
            return Environment.OSVersion.Platform.ToString();
        }

        public List<string> GetMeasuringInstruments()
        {
            return new List<string>()
            {
                "Intel Power Gadget",
                "Libre Hardware Monitor"
            };
        }
    }
}
