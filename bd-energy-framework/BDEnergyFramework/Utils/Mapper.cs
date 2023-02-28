﻿using BDEnergyFramework.Models;
using BDEnergyFramework.Models.Internal;
using Microsoft.VisualBasic;

namespace BDEnergyFramework.Utils
{
    public static class Mapper
    {
        internal static Measurement Map(IntelPowerGadgetData intelPowerGadgetData, DateTime startTime, DateTime endTime, long elapsedMilliseconds, double startTemperature, double endTemperature, int iteration)
        {
            return new Measurement()
            {
                DramEnergyInJoules = intelPowerGadgetData.CumulativeDramEnergyInJoules,
                CpuEnergyInJoules = intelPowerGadgetData.CumulativeProcessorEnergyInJoules,
                GpuEnergyInJoules = intelPowerGadgetData.CumulativeGtEnergyInJoules,
                StartTime = startTime,
                EndTime = endTime,
                Duration = elapsedMilliseconds,
                StartTemperature = startTemperature,
                EndTemperature = endTemperature,
                Iteration = iteration,
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
                CpuEnergyInJoules = float.Parse(ts.CumulativeProcessorEnergy_0Joules),
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

        internal static Configuration Map(MeasurementConfiguration config, List<int> allocatedCores)
        {
            return new Configuration()
            {
                AllocatedCores = allocatedCores,
                Burnin = config.BurnInPeriod,
                MaximumTemperature = config.MaximumTemperature,
                MinimumTemperature = config.MinimumTemperature,
            };
        }

        internal static TestCase Map(MeasurementConfiguration config, string testCasePath, string parameter)
        {
            var testCaseName = PathUtils.GetFilenameFromPath(testCasePath);

            return new TestCase()
            {
                Compiler = config.Compiler,
                Language = config.Language,
                Name= testCaseName,
                Optimizations= config.Optimizations,
                Parameter = parameter,
                TestCaseSize = config.TestCaseType,
                ConcurrencyLimit = config.ConcurrencyLimit,
            };
        }

        internal static DeviceUnderTest Map(MeasurementConfiguration configId, string machineName)
        {
            return new DeviceUnderTest()
            {
                Name = machineName,
                Os = DutUtils.GetOperatingSystem()
            };
        }

        internal static MeasurementInstrument Map(EMeasuringInstrument measurementInstrument)
        {
            return new MeasurementInstrument()
            {
                Name = measurementInstrument.ToString()
            };
        }

        internal static MeasurementCollection Map(int configId, int testCaseId, int dutId, int measurementInstrumentId, MeasurementConfiguration config)
        {
            return new MeasurementCollection()
            {
                CollectionName = config.ExperimentName,
                CollectionNumber = config.ExperimentNumber,
                TestCaseId= testCaseId,
                DutId= dutId,
                ConfigurationId= configId,
                MeasurementInstrumentId= measurementInstrumentId,
                AdditionalMetadata= config.AdditionalMetadata,
            };
        }
    }
}
