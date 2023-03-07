using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.Models.Dto
{
    public class DtoMeasurement
    {
        public int Id { get; set; }
        public int Iteration { get; set; }
        public int CollectionId { get; set; }
        public decimal PackageTemperatureBegin { get; set; }
        public decimal PackageTemperatureEnd { get; set; }
        public decimal Duration { get; set; }
        public decimal DramEnergyInJoules { get; set; }
        public decimal GpuEnergyInJoules { get; set; }
        public decimal CpuEnergyInJoules { get; set; }
        public DateTime BeginTime { get; set; }
        public DateTime EndTime { get; set; }
        public string AdditionalMetadata { get; set; }
    }
}
