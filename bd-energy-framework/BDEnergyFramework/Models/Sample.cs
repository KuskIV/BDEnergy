namespace BDEnergyFramework.Models
{
    public class Sample
    {
        internal string PackagePl2InWatt;

        public string Temperature { get; internal set; }
        public string ElapsedTime { get; internal set; }
        public string Time { get; internal set; }
        public string CpuUtilization { get; internal set; }
        public string CpuFrequencyMhz { get; internal set; }
        public string ProcessorPower { get; internal set; }
        public string CumulativeProcessorEnergyInJoules { get; internal set; }
        public string DramEnergyInJoules { get; internal set; }
        public string GpuEnergyInJoules { get; internal set; }
        public string PackagePl1InWatt { get; internal set; }
        public string PackagePl4InWatt { get; internal set; }
        public string PsysPl2InWatt { get; internal set; }
        public string PsysPl1InWatt { get; internal set; }
        public int GpuFrequencyMhz { get; internal set; }
        public string GpuUtilization { get; internal set; }
    }
}