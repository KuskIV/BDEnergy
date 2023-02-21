using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.Models
{
    public class Measurement
    {
        public double DramEnergyInJoules { get; set; }
        public double ProcessorEnergyInJoules { get; set; }
        public double GpuEnergyInJoules { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
        public long Duration { get; set; }
        public Dictionary<string, double> AdditionalMetadata { get; set; } = new Dictionary<string, double>();
    }
}
