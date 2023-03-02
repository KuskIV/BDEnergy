using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RaspberryEnergyProcessing.Model
{
    public class Measurement
    {
        public double C1TrueRMS { get; set; }
        public double C1ACRMS { get; set; }
        public DateTime time { get; set; }
    }
}
