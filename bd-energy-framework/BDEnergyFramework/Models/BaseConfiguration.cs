using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.Models
{
    public class BaseConfiguration
    {
        public List<EMeasuringInstrument> MeasurementInstruments { get; set; }
        public int RequiredMeasurements { get; set; }
        public List<List<int>> AllocatedCores { get; set; }
        public int BurnInPeriod { get; set; }
        public bool UploadToDatabase { get; set; }
        public bool DisableWifi { get; set; }
        public int MinimumTemperature { get; set; }
        public int MaximumTemperature { get; set; }
        public int ExperimentNumber { get; set; }
        public string ExperimentName { get; set; }
        public string ConcurrencyLimit { get; set; }
        public string TestCaseType { get; set; }
        public string Compiler { get; set; }
        public string Optimizations { get; set; }
        public string Language { get; set; }
        public bool StopBackgroundProcesses { get; set; }
        public Dictionary<string, string> AdditionalMetadata { get; set; }
    }
}
