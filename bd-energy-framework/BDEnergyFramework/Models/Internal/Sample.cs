﻿namespace BDEnergyFramework.Models.Internal
{
    public class Sample
    {
        public double PackageTemperature { get; internal set; }
        public double ElapsedTime { get; internal set; }
        public double ProcessorPowerWatt { get; internal set; }
        public double DramEnergyInJoules { get; internal set; }
        public double GpuEnergyInJoules { get; internal set; }
        public double CpuUtilization { get; internal set; }
        public double CpuEnergyInJoules { get; internal set; }
        public Dictionary<string, double> AdditionalMetadata { get; set; }
    }
}