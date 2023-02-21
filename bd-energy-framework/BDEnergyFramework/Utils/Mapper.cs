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
                Duration = elapsedMilliseconds,
                AdditionalMetadata = new Dictionary<string, double>()
                {

                }
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
                PackageTemperature = float.Parse(ts.PackageTemperature_0C),
                ElapsedTime = float.Parse(ts.ElapsedTimesec),
                CpuUtilization = float.Parse(ts.CPUUtilization),
                ProcessorPowerWatt = float.Parse(ts.ProcessorPower_0Watt),
                DramEnergyInJoules = float.Parse(ts.CumulativeDRAMEnergy_0Joules),
                GpuEnergyInJoules = float.Parse(ts.CumulativeGTEnergy_0Joules),
                ProcessorEnergyInJoules = float.Parse(ts.CumulativeProcessorEnergy_0Joules),
                AdditionalMetadata = new Dictionary<string, double>()
                {
                    { "GpuUtilization", float.Parse(ts.GTUtilization) },
                    { "CpuFrequencyMhz", float.Parse(ts.CPUFrequency_0MHz) },
                    { "GpuFrequencyMhz", ts.GTFrequencyMHz },
                    { "PackagePl1InWatt", float.Parse(ts.PackagePL1_0Watt) },
                    { "PackagePl2InWatt", float.Parse(ts.PackagePL2_0Watt) },
                    { "PackagePl4InWatt", float.Parse(ts.PackagePL4_0Watt) },
                    { "PsysPl1InWatt", float.Parse(ts.PlatformPsysPL1_0Watt) },
                    { "PsysPl2InWatt", float.Parse(ts.PlatformPsysPL2_0Watt) }
                },
            };
        }
    }
}
