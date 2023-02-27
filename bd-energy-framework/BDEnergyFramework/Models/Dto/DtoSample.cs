using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.Models.Dto
{
    public class DtoSample
    {
        public int Id { get; set; }
        public int CollectionId { get; set; }
        public decimal PackageTemperature { get; set; }
        public decimal ElapsedTime { get; set; }
        public decimal ProcessorPowerInWatt { get; set; }
        public decimal DramEnergyInJoules { get; set; }
        public decimal GpuEnergyInJoules { get; set; }
        public decimal CpuEnergyInJoules { get; set; }
        public decimal CpuUtilization { get; set; }
        public Dictionary<string, string> AdditionalMetadata { get; set; }
    }
}
