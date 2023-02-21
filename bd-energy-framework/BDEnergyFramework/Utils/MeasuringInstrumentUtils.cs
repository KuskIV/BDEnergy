using BDEnergyFramework.MeasuringInstruments;
using BDEnergyFramework.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.Utils
{
    public static class MeasuringInstrumentUtils
    {
        public static MeasuringInstrument GetMeasuringInstrument(EMeasuringInstrument mi)
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

        private static MeasuringInstrument GetLibreHardwareMonitor()
        {
            return new HardwareMonitor(EMeasuringInstrument.LHM);
        }

        private static MeasuringInstrument GetIntelPowerGadget()
        {
            return new IntelPowerGadget(EMeasuringInstrument.IPG);
        }

        private static MeasuringInstrument GetRapl()
        {
            throw new NotImplementedException();
        }
    }
}
