using BDEnergyFramework.Models;
using BDEnergyFramework.Utils;
using OpenHardwareMonitor.Hardware;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Timers;

namespace BDEnergyFramework.MeasuringInstruments
{
    internal class HardwareMonitor : MeasuringInstrument, IDisposable
    {
        private Computer _computer;

        private TimeSeries _timeSeries= new TimeSeries();
        private DateTime _startTime;
        private Dictionary<(SensorType sensorType, string name), float> _cpuValues = new Dictionary<(SensorType sensorType, string name), float>();

        public HardwareMonitor(EMeasuringInstrument measuringInstrument) : base(measuringInstrument)
        {

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

        internal override (TimeSeries, Measurement) ParseData(string path, DateTime startTime, DateTime endTime, long elapsedMilliseconds)
        {
            var totalDramJoules = CalculateEnergy(_timeSeries.Sampels.Select(x => x.DramEnergyInJoules).ToList(), elapsedMilliseconds);
            var totalGpuJoules = CalculateEnergy(_timeSeries.Sampels.Select(x => x.GpuEnergyInJoules).ToList(), elapsedMilliseconds);
            var totalCpuJoules = CalculateEnergy(_timeSeries.Sampels.Select(x => x.ProcessorEnergyInJoules).ToList(), elapsedMilliseconds);

            var measurement = new Measurement()
            {
                StartTime = startTime,
                EndTime = endTime,
                Duration = elapsedMilliseconds,
                DramEnergyInJoules = totalDramJoules,
                ProcessorEnergyInJoules = totalCpuJoules,
                GpuEnergyInJoules = totalGpuJoules,
                AdditionalMetadata = new Dictionary<string, double>() { }
            };

            return (_timeSeries, measurement);
        }

        internal override void PerformMeasuring(object sender, ElapsedEventArgs e)
        {
            UpdateCpuValues();

            var elapesTime = (DateTime.UtcNow - _startTime).TotalMilliseconds / 1000;
            var gpuEnergyInJoules = GetGpuEnergy();
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
                    ProcessorEnergyInJoules = processorPower,
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
            double averagePower = wattMeasurements.Average();

            // Calculate the energy used in joules using the formula: energy = power * time
            double energyInJoules = averagePower * durationInSeconds;

            return energyInJoules;
        }

        private double GetGpuEnergy()
        {
            return GetCpuValue(SensorType.Power, HardwareMonitorNames.CpuGraphics);
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

        private double GetCpuValue(SensorType sensor, string name)
        {
            if (_cpuValues.TryGetValue(GenerateKey(sensor, name), out var value))
            {
                return value;
            }

            throw new ArgumentException($"Unable to get values for {sensor}, {name}");
        }

        private List<(string core, double value)> GetCpuCoreValues(SensorType sensor)
        {
            var cpuValues = new List<(string core, double value)>();
            var core = 1;

            while (_cpuValues.TryGetValue(GenerateKey(sensor, core), out var value))
            {
                cpuValues.Add(($"{sensor} {HardwareMonitorNames.GetCpuCore(core)}", value));

                core++;
            }

            return cpuValues;
        }

        private (SensorType sensorType, string name) GenerateKey(SensorType sensor, int core)
        {
            return (sensor, HardwareMonitorNames.GetCpuCore(core));
        }

        private (SensorType sensorType, string name) GenerateKey(SensorType sensor, string name)
        {
            return (sensor, name);
        }

        private void UpdateCpuValues()
        {
            _cpuValues = new Dictionary<(SensorType sensorType, string name), float>();

            foreach (var hardware in _computer.Hardware)
            {
                hardware.Update();

                foreach (var sensor in hardware.Sensors)
                {
                    try
                    {
                        if (sensor.Value is float value)
                        {
                            _cpuValues.Add((sensor.SensorType, sensor.Name), value);
                        }
                    }
                    catch (Exception e)
                    {
                        throw;
                    }
                }
            }
        }
    }
}
