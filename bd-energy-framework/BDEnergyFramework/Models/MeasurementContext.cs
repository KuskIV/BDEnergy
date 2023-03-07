using BDEnergyFramework.Models.Internal;
using BDEnergyFramework.Utils;

namespace BDEnergyFramework.Models
{
    public class MeasurementContext
    {
        public MeasurementContext(string testCase, string parameter, EMeasuringInstrument measurementInstrument, List<int> allocatedCores)
        {
            Parameter  = parameter;
            MeasurementInstrument = measurementInstrument;
            TestCase = PathUtils.GetFilenameFromPath(testCase);
            AllocatedCores = allocatedCores;
        }

        public MeasurementContext()
        {
            
        }

        public List<int> AllocatedCores { get; set; }
        public List<TimeSeries> TimeSeries { get; set; } = new List<TimeSeries>();
        public List<Measurement> Measurements { get; set; } = new List<Measurement>();
        public string Parameter { get; set; }
        public string TestCase { get; set; }
        public EMeasuringInstrument MeasurementInstrument { get; set; }
    }
}
