using BDEnergyFramework.Models;

namespace BDEnergyFramework.Utils
{
    public static class Mapper
    {
        internal static Measurement Map(IntelPowerGadgetData intelPowerGadgetData, DateTime startTime, DateTime endTime, long elapsedMilliseconds)
        {
            return new Measurement()
            {
                DramEnergyInJoules = intelPowerGadgetData.CumulativeDramEnergyInJoules,
                ProcessorEnergyInJoules = intelPowerGadgetData.CumulativeProcessorEnergyInJoules,
                GpuEnergyInJoules = intelPowerGadgetData.CumulativeGtEnergyInJoules,
                StartTime = startTime,
                EndTime = endTime,
                Duration = elapsedMilliseconds
            };
        }

        internal static TimeSeries Map(List<IntelPowerGadgetTimeSeries> igpData)
        {
            var timeSeries = new TimeSeries();

            timeSeries.Sampels = igpData.Select(x => Map(x)).ToList();

            return timeSeries;
        }

        internal static List<EMeasuringInstrument> MapToMeasuringInstrumentEnum(List<string> measuringInstruments)
        {
            return measuringInstruments.Select(x => MapToMeasuringInstrumentEnum(x)).ToList();
        }

        private static EMeasuringInstrument MapToMeasuringInstrumentEnum(string mi)
        {
            return mi switch
            {
                MeasuringInstruments.IntelPowerGadget => EMeasuringInstrument.IPG,
                MeasuringInstruments.LibreHardwareMonitor => EMeasuringInstrument.LHM,
                MeasuringInstruments.RAPL => EMeasuringInstrument.RAPL,
                _ => throw new ArgumentException($"Measuring instrument '{mi}' is not valid"),
            };
        }

        public static List<string> MapFromMeasuringInstrumentEnum(List<EMeasuringInstrument> mis)
        {
            return mis.Select(x => MapFromMeasuringInstrumentEnum(x)).ToList();
        }

            public static string MapFromMeasuringInstrumentEnum(EMeasuringInstrument mi)
        {
            switch (mi)
            {
                case EMeasuringInstrument.RAPL:
                    return MeasuringInstruments.RAPL;
                case EMeasuringInstrument.IPG:
                    return MeasuringInstruments.IntelPowerGadget;
                case EMeasuringInstrument.LHM:
                    return MeasuringInstruments.LibreHardwareMonitor;
                default:
                    throw new ArgumentException($"'{mi}' cannot be mapped");
            }
        }

        private static Sample Map(IntelPowerGadgetTimeSeries ts)
        {
            return new Sample()
            {
                Temperature = ts.PackageTemperature_0C,
                ElapsedTime = ts.ElapsedTimesec,
                Time = ts.SystemTime,
                CpuUtilization = ts.CPUUtilization,
                GpuUtilization = ts.GTUtilization,
                CpuFrequencyMhz = ts.CPUFrequency_0MHz,
                GpuFrequencyMhz = ts.GTFrequencyMHz,
                ProcessorPower = ts.ProcessorPower_0Watt,
                CumulativeProcessorEnergyInJoules = ts.CumulativeProcessorEnergy_0Joules,
                DramEnergyInJoules = ts.CumulativeDRAMEnergy_0Joules,
                GpuEnergyInJoules = ts.CumulativeGTEnergy_0Joules,
                PackagePl1InWatt = ts.PackagePL1_0Watt,
                PackagePl2InWatt = ts.PackagePL2_0Watt,
                PackagePl4InWatt = ts.PackagePL4_0Watt,
                PsysPl1InWatt = ts.PlatformPsysPL1_0Watt,
                PsysPl2InWatt = ts.PlatformPsysPL2_0Watt,
            };
        }
    }
}
