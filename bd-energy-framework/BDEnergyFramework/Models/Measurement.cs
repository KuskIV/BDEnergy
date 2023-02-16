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
        public float DramEnergyInJoules { get; set; }
        public float ProcessorEnergyInJoules { get; set; }
        public float GpuEnergyInJoules { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
        public long Duration { get; set; }
    }
}
