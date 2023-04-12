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
                    return GetClamp(logger);
                case EMeasuringInstrument.SCAPHANDRE:
                    return GetScaphandre();
                case EMeasuringInstrument.PLUG:
                    return GetPlug(logger);
                case EMeasuringInstrument.HWM:
                    return GetHardwareMonitor(logger);
                default:
                    throw new NotImplementedException($"'{mi}' is not implemented");
            }
        }

        private static MeasuringInstrument GetHardwareMonitor(ILogger logger)
        {
            throw new NotImplementedException();
        }

        private static MeasuringInstrument GetPlug(ILogger logger)
        {
            return new Plug(EMeasuringInstrument.PLUG, logger);
        }

        private static MeasuringInstrument GetScaphandre()
        {
            return new Scaphandre(EMeasuringInstrument.SCAPHANDRE);
        }

        private static MeasuringInstrument GetClamp(ILogger logger)
        {
            return new Clamp(EMeasuringInstrument.CLAMP, logger);
        }

        private static MeasuringInstrument GetLibreHardwareMonitor(ILogger logger)
        {
            return new LibreHardwareMonitorInstrument(EMeasuringInstrument.LHM, logger);
        }

        private static MeasuringInstrument GetIntelPowerGadget()
        {
            return new IntelPowerLog(EMeasuringInstrument.IPG);
            //return new IntelPowerGadget(EMeasuringInstrument.IPG);
        }

        private static MeasuringInstrument GetRapl()
        {
            return new Rapl(EMeasuringInstrument.RAPL);
        }
    }
}
