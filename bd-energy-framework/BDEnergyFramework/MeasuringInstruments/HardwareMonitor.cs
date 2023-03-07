using BDEnergyFramework.Models;
using BDEnergyFramework.Models.Internal;
using BDEnergyFramework.Utils;
using Microsoft.Extensions.Logging;
using OpenHardwareMonitor.Hardware;
using System.Timers;
using ILogger = Serilog.ILogger;

namespace BDEnergyFramework.MeasuringInstruments
{
    internal class HardwareMonitor : MeasuringInstrument, IDisposable
    {
        private Computer _computer;

        private TimeSeries _timeSeries= new TimeSeries();
        private DateTime _startTime;

        public ILogger _logger { get; }

        public HardwareMonitor(EMeasuringInstrument measuringInstrument, ILogger logger) : base(measuringInstrument)
        {
            _logger = logger;
        }

        internal override int GetMilisecondsBetweenSampels()
        {
            return 500;
        }

        internal override void StartMeasuringInstruments(string path)
        {
            _computer = new Computer()
            {
                CPUEnabled = true,
                MainboardEnabled = true,
                RAMEnabled = true,
                GPUEnabled = true,
            };

            _computer.Open();

            _timeSeries = new TimeSeries();
            _startTime = DateTime.UtcNow;
        }

        internal override void StopMeasuringInstrument()
        {
            _computer.Close();
            // Do nothing
        }

        internal override (TimeSeries, Measurement) ParseData(string path, DateTime startTime, DateTime endTime, long elapsedMilliseconds, double startTemperature, double endTemperature, int iteration)
        {
            var totalDramJoules = CalculateEnergy(_timeSeries.Sampels.Select(x => x.DramEnergyInJoules).ToList(), elapsedMilliseconds);
            var totalGpuJoules = CalculateEnergy(_timeSeries.Sampels.Select(x => x.GpuEnergyInJoules).ToList(), elapsedMilliseconds);
            var totalCpuJoules = CalculateEnergy(_timeSeries.Sampels.Select(x => x.CpuEnergyInJoules).ToList(), elapsedMilliseconds);

            var measurement = new Measurement()
            {
                StartTime = startTime,
                EndTime = endTime,
                Duration = elapsedMilliseconds,
                DramEnergyInJoules = totalDramJoules,
                CpuEnergyInJoules = totalCpuJoules,
                GpuEnergyInJoules = totalGpuJoules,
                StartTemperature = startTemperature,
                EndTemperature = endTemperature,
                Iteration = iteration,
                AdditionalMetadata = new Dictionary<string, double>() { }
            };

            return (_timeSeries, measurement);
        }

        internal override void PerformMeasuring(object sender, ElapsedEventArgs e)
        {
            var elapseTime = (DateTime.UtcNow - _startTime).TotalMilliseconds / 1000;
            var gpuEnergyInJoules = GetGpuEnergyOrDefault(update:true);
            var packageTemperature = GetPackageTemperatureOrDefault();
            var processorPower = GetPackagePowerOrDefault();
            var corePower = GetCorePowerOrDefault();
            var totalCpuLoad = GetTotalCpuLoadOrDefault();
            var dramEnergyInJoules = GetDramPowerOrDefault();
            var coreLoad = GetCpuCoreValuesOrDefault(SensorType.Load);
            var coreTemperature = GetCpuCoreValuesOrDefault(SensorType.Temperature);
            var coreClock = GetCpuCoreValuesOrDefault(SensorType.Clock);

            var additionalMetadata = new Dictionary<string, double>();

            foreach (var c in coreLoad.Concat(coreTemperature).Concat(coreClock))
            {
                additionalMetadata.Add(c.core, c.value);
            }

            additionalMetadata.Add("Power CPU Cores", corePower);

            
            _timeSeries.Sampels.Add(
                new Sample()
                {
                    GpuEnergyInJoules = gpuEnergyInJoules,
                    PackageTemperature = packageTemperature,
                    ElapsedTime = elapseTime,
                    ProcessorPowerWatt = processorPower,
                    CpuUtilization = totalCpuLoad,
                    DramEnergyInJoules = dramEnergyInJoules,
                    AdditionalMetadata = additionalMetadata,
                    CpuEnergyInJoules = processorPower,
                });
        }

        public void Dispose()
        {
            _computer.Close();
        }

        public double CalculateEnergy(List<double> wattMeasurements, long durationInMilliseconds)
        {
            // Convert duration to seconds
            double durationInSeconds = durationInMilliseconds / 1000.0;

            // Calculate the average power in watts
            double averagePower = wattMeasurements.Average(); // TODO: Empty list, System.InvalidOperationException

            // Calculate the energy used in joules using the formula: energy = power * time
            double energyInJoules = averagePower * durationInSeconds;

            return energyInJoules;
        }

        private double GetGpuEnergyOrDefault(bool update=false)
        {
            var defaultValue = -1d;

            if (_timeSeries.Sampels.Any())
            {
                defaultValue = _timeSeries.Sampels.Last().GpuEnergyInJoules;
            }
            return GetCpuValue(SensorType.Power, HardwareMonitorNames.CpuGraphics, defaultValue, update:update);
        }

        private double GetPackageTemperatureOrDefault()
        {
            var defaultValue = -1d;

            if (_timeSeries.Sampels.Any())
            {
                defaultValue = _timeSeries.Sampels.Last().PackageTemperature;
            }
            return GetCpuValue(SensorType.Temperature, HardwareMonitorNames.CpuPackage, defaultValue);
        }

        private double GetPackagePowerOrDefault()
        {
            var defaultValue = -1d;

            if (_timeSeries.Sampels.Any())
            {
                defaultValue = _timeSeries.Sampels.Last().CpuEnergyInJoules;
            }
            return GetCpuValue(SensorType.Power, HardwareMonitorNames.CpuPackage, defaultValue);
        }

        private double GetCorePowerOrDefault()
        {
            var defaultValue = -1d;

            if (_timeSeries.Sampels.Any())
            {
                defaultValue = _timeSeries.Sampels.Last().CpuEnergyInJoules;
            }
            return GetCpuValue(SensorType.Power, HardwareMonitorNames.CpuCore, defaultValue);
        }

        private double GetTotalCpuLoadOrDefault()
        {
            var defaultValue = -1d;

            if (_timeSeries.Sampels.Any())
            {
                defaultValue = _timeSeries.Sampels.Last().CpuUtilization;
            }
            return GetCpuValue(SensorType.Load, HardwareMonitorNames.CpuTotal, defaultValue);
        }

        private double GetDramPowerOrDefault()
        {
            var defaultValue = -1d;

            if (_timeSeries.Sampels.Any())
            {
                defaultValue = _timeSeries.Sampels.Last().DramEnergyInJoules;
            }

            return GetCpuValue(SensorType.Power, HardwareMonitorNames.CpuDram, defaultValue);
        }

        private double GetCpuValue(SensorType sensor, string name, double defaultValue, bool update=false)
        {
            if (TryGetCpuValue(sensor, name, out var value, update))
            {
                return value;
            }

            _logger.Debug("Unable to get cpu value for sensor '{sensor}', name '{name}'", sensor, name);

            return defaultValue;
        }

        private List<(string core, double value)> GetCpuCoreValuesOrDefault(SensorType sensor)
        {
            var cpuValues = new List<(string core, double value)>();
            var core = 1;

            var valueExists = true;

            while (valueExists)
            {
                var name = HardwareMonitorNames.GetCpuCore(core);

                valueExists = TryGetCpuValue(sensor, name, out var cpuValue);
                var cpuName = $"{sensor} {name}";

                if (!valueExists && 
                    _timeSeries.Sampels.Any() && 
                    _timeSeries.Sampels.Last().AdditionalMetadata.TryGetValue(cpuName, out var value))
                {
                    cpuValue = (float)value;
                    valueExists = true;
                }

                if (valueExists)
                {
                    cpuValues.Add((cpuName, cpuValue));
                }

                core++;
            }

            return cpuValues;
        }

        private bool TryGetCpuValue(SensorType sensorType, string name, out float cpuValue, bool update = false)
        {
            cpuValue = -1;

            foreach (var hardware in _computer.Hardware)
            {
                if (update)
                {
                    hardware.Update();
                }

                foreach (var sensor in hardware.Sensors)
                {
                    if (sensor.SensorType == sensorType && sensor.Name == name)
                    {
                        cpuValue = sensor.Value is float value ? value : -1;
                        return true;
                    }
                }
            }

            return false;
        }
    }
}
