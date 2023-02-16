using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.Utils
{
    public static class MeasuringInstrumentUtils
    {
        public static IMeasuringInstrument GetMeasuringInstrument(EMeasuringInstrument mi)
        {
            switch (mi)
            {
                case EMeasuringInstrument.RAPL:
                    return GetRapl();
                case EMeasuringInstrument.IPG:
                    return GetIntelPowerGadget();
                case EMeasuringInstrument.LHM:
                    return GetLibreHardwareMonitor();
                default:
                    throw new NotImplementedException($"'{mi}' is not implemented");
            }
        }

        private static IMeasuringInstrument GetLibreHardwareMonitor()
        {
            throw new NotImplementedException();
        }

        private static IMeasuringInstrument GetIntelPowerGadget()
        {
            return new IntelPowerGadget();
        }

        private static IMeasuringInstrument GetRapl()
        {
            throw new NotImplementedException();
        }
    }
}
