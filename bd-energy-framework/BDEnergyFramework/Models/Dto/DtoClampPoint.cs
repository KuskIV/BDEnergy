using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.Models.Dto
{
    public class DtoClampPoint
    {
        public double C1TrueRMS { get; set; }
        public double C1ACRMS { get; set; }
        public DateTime Time { get; set; }
    }
}
