namespace BDEnergyFramework.Models.Internal
{
    public class Measurement
    {
        public double DramEnergyInJoules { get; set; }
        public int Iteration { get; set; }
        public double CpuEnergyInJoules { get; set; }
        public double GpuEnergyInJoules { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
        public double StartTemperature { get; set; }
        public double EndTemperature { get; set; }
        public long Duration { get; set; }
        public Dictionary<string, double> AdditionalMetadata { get; set; } = new Dictionary<string, double>();
        public bool HasBeenSaved = false;
    }
}
