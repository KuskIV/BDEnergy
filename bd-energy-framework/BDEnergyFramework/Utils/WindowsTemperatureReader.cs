

using OpenHardwareMonitor.Hardware;

namespace BDEnergyFramework.Utils
{
    public static class WindowsTemperatureReader
    {
        public static double GetCpuTemperature()
        {
            Computer computer = new Computer();
            computer.CPUEnabled = true;

            computer.Open();
            float temperature = -1;

            foreach (var hardware in computer.Hardware)
            {
                if (hardware.HardwareType == HardwareType.CPU)
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
    }
}
