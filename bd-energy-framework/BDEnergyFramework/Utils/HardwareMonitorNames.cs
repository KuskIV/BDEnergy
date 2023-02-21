using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.Utils
{
    public static class HardwareMonitorNames
    {
        public static string CpuCoreNumber = "CPU Core #";
        public static string CpuTotal = "CPU Total";
        public static string CpuPackage = "CPU Package";
        public static string CpuCore = "CPU Cores";
        public static string CpuGraphics = "CPU Graphics";
        public static string CpuDram = "CPU DRAM";
        public static string BusSpeed = "Bus Speed";

        public static string GetCpuCore(int number)
        {
            return $"{CpuCoreNumber}{number}";
        }
    }
}
