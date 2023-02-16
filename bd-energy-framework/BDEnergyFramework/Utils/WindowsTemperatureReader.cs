using System;
using System.Collections.Generic;
using System.Linq;
using System.Management;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.Utils
{
    public static class WindowsTemperatureReader
    {
        public static double GetCpuTemperature()
        {
            double temperature = 0;

            var scope = new ManagementScope(@"\\.\root\WMI");

            var query = new SelectQuery("SELECT * FROM MSAcpi_ThermalZoneTemperature");

            using (ManagementObjectSearcher searcher = new ManagementObjectSearcher(scope, query))
            {
                foreach (ManagementObject obj in searcher.Get())
                {
                    temperature = Convert.ToDouble(obj["CurrentTemperature"].ToString()) / 10.0 - 273.15;
                }
            }

            return temperature;
        }
    }
}
