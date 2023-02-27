using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.Models.Internal
{
    public class MeasurementCollection
    {
        public string CollectionName { get; set; }
        public int CollectionNumber { get; set; }
        public int ConfigurationId { get; set; }
        public int TestCaseId { get; set; }
        public int DutId { get; set; }
        public int MeasurementInstrumentId { get; set; }
        public Dictionary<string, string> AdditionalMetadata { get; set; }
    }
}
