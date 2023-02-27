using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.Models.Dto
{
    public class DtoConfiguration
    {
        public int Id { get; set; }
        public int MinimumTemperature { get; set; }
        public int MaximumTemperature { get; set; }
        public int Burnin { get; set; }
        public string AllocatedCores { get; set; }
    }
}
