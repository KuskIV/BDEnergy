﻿using BDEnergyFramework.Models.Internal;

namespace BDEnergyFramework.Models
{
    public class MeasurementContext
    {
        public MeasurementContext(string testCase, string parameter, EMeasuringInstrument measurementInstrument, List<int> allocatedCores)
        {
            Parameter  = parameter;
            MeasurementInstrument = measurementInstrument;
            TestCase = testCase;
            AllocatedCores = allocatedCores;
        }

        public List<int> AllocatedCores { get; set; }
        public List<TimeSeries> TimeSeries { get; set; } = new List<TimeSeries>();
        public List<Measurement> Measurements { get; set; } = new List<Measurement>();
        public string Parameter { get; set; }
        public string TestCase { get; set; }
        public EMeasuringInstrument MeasurementInstrument { get; set; }
    }
}
