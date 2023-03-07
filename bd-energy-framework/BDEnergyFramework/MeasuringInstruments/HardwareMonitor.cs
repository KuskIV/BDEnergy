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
        private Dictionary<(SensorType sensorType, string name), float> _cpuValues = new Dictionary<(SensorType sensorType, string name), float>();

        public ILogger _logger { get; }

        public HardwareMonitor(EMeasuringInstrument measuringInstrument, ILogger logger) : base(measuringInstrument)
        {
            _logger = logger;
        }

        internal override int GetMilisecondsBetweenSampels()
        {
            return 100;
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
            //UpdateCpuValues();

            var elapesTime = (DateTime.UtcNow - _startTime).TotalMilliseconds / 1000;
            var gpuEnergyInJoules = GetGpuEnergy(update:true);
            var packageTemperature = GetPackageTemperature();
            var processorPower = GetPackagePower();
            var corePower = GetCorePower();
            var totalCpuLoad = GetTotalCpuLoad();
            var dramEnergyInJoules = GetDramPower();
            var coreLoad = GetCpuCoreValues(SensorType.Load);
            var coreTemperature = GetCpuCoreValues(SensorType.Temperature);
            var coreClock = GetCpuCoreValues(SensorType.Clock);

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
                    ElapsedTime = elapesTime,
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

        /// <summary>
        /// Calculate the total and average energy consumption in joules from watts.
        ///  W * (IntervalBetweenReadsInMiliSeconds/1000) + W * (IntervalBetweenReadsInMiliSeconds/1000) + .... 
        /// </summary>
        private (double, double) GetEnergyTotalJoules(List<double> floats, long interval)
        {
            double totalJoule = 0;
            int nRecords = 0;
            double periodOfWatt = (double)interval / 1000;
            foreach (var f in floats)
            {
                totalJoule += (f * periodOfWatt);
                nRecords++;
            }
            double averageJoule = totalJoule / nRecords;
            return (totalJoule, averageJoule);
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

        private double GetGpuEnergy(bool update=false)
        {
            return GetCpuValue(SensorType.Power, HardwareMonitorNames.CpuGraphics, update:update);
        }

        private double GetPackageTemperature()
        {
            return GetCpuValue(SensorType.Temperature, HardwareMonitorNames.CpuPackage);
        }

        private double GetPackagePower()
        {
            return GetCpuValue(SensorType.Power, HardwareMonitorNames.CpuPackage);
        }

        private double GetCorePower()
        {
            return GetCpuValue(SensorType.Power, HardwareMonitorNames.CpuCore);
        }

        private double GetTotalCpuLoad()
        {
            return GetCpuValue(SensorType.Load, HardwareMonitorNames.CpuTotal);
        }

        private double GetDramPower()
        {
            return GetCpuValue(SensorType.Power, HardwareMonitorNames.CpuDram);
        }

        private double GetCpuValue(SensorType sensor, string name, bool update=false)
        {
            if (TryGetCpuValue(sensor, name, out var value, update))
            {
                return value;
            }

            _logger.Debug("Unable to get cpu value for sensor '{sensor}', name '{name}'", sensor, name);

            return -1;

            //throw new ArgumentException($"Value for sensor '{sensor}', name '{name}' does not exists");

            //return GetCpuValue(sensor, name);

            //var key = GenerateKey(sensor, name);

            //lock (_cpuValues)
            //{
            //    if (_cpuValues.TryGetValue(key, out var value))
            //    {
            //        return value;
            //    }
            //}

            //throw new ArgumentException($"Unable to get values for {sensor}, {name}");
        }

        private List<(string core, double value)> GetCpuCoreValues(SensorType sensor)
        {
            var cpuValues = new List<(string core, double value)>();
            var core = 1;

            var valueExists = true;

            while (valueExists)
            {
                var name = HardwareMonitorNames.GetCpuCore(core);

                valueExists = TryGetCpuValue(sensor, name, out var cpuValue);
                cpuValues.Add(($"{sensor} {name}", cpuValue));


                core++;
            }


            //while (_cpuValues.TryGetValue(GenerateKey(sensor, core), out var value))
            //{
            //    cpuValues.Add(($"{sensor} {HardwareMonitorNames.GetCpuCore(core)}", value));

            //    core++;
            //}

            return cpuValues;
        }

        //private (SensorType sensorType, string name) GenerateKey(SensorType sensor, int core)
        //{
        //    return (sensor, HardwareMonitorNames.GetCpuCore(core));
        //}

        //private (SensorType sensorType, string name) GenerateKey(SensorType sensor, string name)
        //{
        //    return (sensor, name);
        //}

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

        //private void UpdateCpuValues()
        //{
        //    lock (_cpuValues)
        //    {
        //        _cpuValues = new Dictionary<(SensorType sensorType, string name), float>();

        //        foreach (var hardware in _computer.Hardware)
        //        {
        //            hardware.Update();

        //            foreach (var sensor in hardware.Sensors)
        //            {
        //                try
        //                {
        //                    if (sensor.Value is float value)
        //                    {
        //                        _cpuValues.Add((sensor.SensorType, sensor.Name), value);
        //                    }
        //                }
        //                catch (Exception e)
        //                {
        //                    throw;
        //                }
        //            }
        //        }
        //    }
        //}
    }
}
