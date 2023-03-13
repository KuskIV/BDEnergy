using BDEnergyFramework.MeasuringInstruments;
using BDEnergyFramework.Models;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ILogger = Serilog.ILogger;

namespace BDEnergyFramework.Utils
{
    public static class MeasuringInstrumentUtils
    {
        public static MeasuringInstrument GetMeasuringInstrument(EMeasuringInstrument mi, ILogger logger)
        {
            switch (mi)
            {
                case EMeasuringInstrument.RAPL:
                    return GetRapl();
                case EMeasuringInstrument.IPG:
                    return GetIntelPowerGadget();
                case EMeasuringInstrument.LHM:
                    return GetLibreHardwareMonitor(logger);
                case EMeasuringInstrument.CLAMP:
                    return GetClamp();
                default:
                    throw new NotImplementedException($"'{mi}' is not implemented");
            }
        }

        private static MeasuringInstrument GetClamp()
        {
            return new Clamp(EMeasuringInstrument.CLAMP);
        }

        private static MeasuringInstrument GetLibreHardwareMonitor(ILogger logger)
        {
            return new HardwareMonitor(EMeasuringInstrument.LHM, logger);
        }

        private static MeasuringInstrument GetIntelPowerGadget()
        {
            return new IntelPowerLog(EMeasuringInstrument.IPG);
            //return new IntelPowerGadget(EMeasuringInstrument.IPG);
        }

        private static MeasuringInstrument GetRapl()
        {
            throw new NotImplementedException();
        }
    }
}
