



using LibreHardwareMonitor.Hardware;
//using OpenHardwareMonitor.Hardware;

namespace BDEnergyFramework.Utils
{
    public static class WindowsTemperatureReader
    {
        public static double GetCpuTemperature()
        {
            try
            {
                var computer = new Computer();
                computer.IsCpuEnabled = true;

                computer.Open();
                var temperature = -1f;

                foreach (var hardware in computer.Hardware)
                {
                    if (hardware.HardwareType == HardwareType.Cpu)
                    {
                        hardware.Update();

                        temperature = hardware.Sensors
                            .Where(x => x.SensorType == SensorType.Temperature)
                            .Select(x => (float)x.Value).Average();

                        break;
                    }
                }

                computer.Close();

                return temperature;
            }
            catch (Exception)
            {
                return 0;
            }
        }
    }
}
