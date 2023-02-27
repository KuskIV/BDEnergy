using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.Models.Internal
{
    public class Configuration
    {
        public int MinimumTemperature { get; set; }
        public int MaximumTemperature { get; set; }
        public int Burnin { get; set; }
        public List<int> AllocatedCores { get; set; }
    }
}
