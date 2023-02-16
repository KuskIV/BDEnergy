using BDEnergyFramework.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.Utils
{
    public static class DutUtils
    {
        public static IDutService GetDutService()
        {
            if (IsWindowsMachine())
            {
                return new WindowsDesktopService();
            }

            throw new NotImplementedException($"The OS {Environment.OSVersion.Platform.ToString()} is not implemented");
        }

        private static bool IsWindowsMachine()
        {
            return Environment.OSVersion.Platform == PlatformID.Win32NT;
        }
    }
}
