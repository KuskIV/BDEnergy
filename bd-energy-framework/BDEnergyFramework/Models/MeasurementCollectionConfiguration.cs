using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.Models
{
    public record MeasurementCollectionConfiguration(
        List<string> MeasurementInstruments,
        int RequiredMeasurements,
        int SampelsBetweenRestart,
        string TestCasePath,
        int ThreadsToExecuteOn)
    {
        public bool ReqiresRestarts => SampelsBetweenRestart > 0;
    }
}
