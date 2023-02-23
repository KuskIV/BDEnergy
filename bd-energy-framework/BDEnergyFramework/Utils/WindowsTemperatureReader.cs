



using OpenHardwareMonitor.Hardware;

namespace BDEnergyFramework.Utils
{
    public static class WindowsTemperatureReader
    {
        public static double GetCpuTemperature()
        {
            var computer = new Computer();
            computer.CPUEnabled = true;

            computer.Open();
            var temperature = -1f;

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
