using BDEnergyFramework.Models;
using BDEnergyFramework.Models.Dto;
using BDEnergyFramework.Models.Internal;
using Microsoft.VisualBasic;
using System.Globalization;
using System.Runtime.CompilerServices;

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
                PackageTemperature = float.Parse(ts.PackageTemperature_0C, CultureInfo.InvariantCulture),
                ElapsedTime = float.Parse(ts.ElapsedTimesec, CultureInfo.InvariantCulture),
                CpuUtilization = float.Parse(ts.CPUUtilization, CultureInfo.InvariantCulture),
                ProcessorPowerWatt = float.Parse(ts.ProcessorPower_0Watt, CultureInfo.InvariantCulture),
                DramEnergyInJoules = float.Parse(ts.CumulativeDRAMEnergy_0Joules, CultureInfo.InvariantCulture),
                GpuEnergyInJoules = float.Parse(ts.CumulativeGTEnergy_0Joules, CultureInfo.InvariantCulture),
                CpuEnergyInJoules = float.Parse(ts.CumulativeProcessorEnergy_0Joules, CultureInfo.InvariantCulture),
                AdditionalMetadata = new Dictionary<string, double>()
                {
                    { "GpuUtilization", float.Parse(ts.GTUtilization, CultureInfo.InvariantCulture) },
                    { "CpuFrequencyMhz", float.Parse(ts.CPUFrequency_0MHz, CultureInfo.InvariantCulture) }, 
                    { "GpuFrequencyMhz", ts.GTFrequencyMHz },
                    { "PackagePl1InWatt", float.Parse(ts.PackagePL1_0Watt, CultureInfo.InvariantCulture) },
                    { "PackagePl2InWatt", float.Parse(ts.PackagePL2_0Watt, CultureInfo.InvariantCulture) },
                    { "PackagePl4InWatt", float.Parse(ts.PackagePL4_0Watt, CultureInfo.InvariantCulture) },
                    { "PsysPl1InWatt", float.Parse(ts.PlatformPsysPL1_0Watt, CultureInfo.InvariantCulture) },
                    { "PsysPl2InWatt", float.Parse(ts.PlatformPsysPL2_0Watt, CultureInfo.InvariantCulture) }
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

        internal static DeviceUnderTest MapToDut(MeasurementConfiguration configId, string machineName, string env)
        {
            return new DeviceUnderTest()
            {
                Name = machineName,
                Os = DutUtils.GetOperatingSystem(),
                Env = env,
            };
        }

        internal static MeasurementInstrument Map(EMeasuringInstrument measurementInstrument, int sampleRate)
        {
            return new MeasurementInstrument()
            {
                Name = measurementInstrument.ToString(),
                SamplesRate = sampleRate,
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

        internal static IEnumerable<Measurement> Map(IEnumerable<DtoMeasurement> response)
        {
            return response.Select(x => Map(x));
        }

        private static Measurement Map(DtoMeasurement x)
        {
            return new Measurement()
            {
                CpuEnergyInJoules = (double)x.CpuEnergyInJoules,
                DramEnergyInJoules = (double)x.DramEnergyInJoules,
                Duration = (long)x.Duration,
                AdditionalMetadata = System.Text.Json.JsonSerializer.Deserialize<Dictionary<string, double>>(x.AdditionalMetadata),
                EndTemperature = (double)x.PackageTemperatureEnd,
                EndTime = x.EndTime,
                GpuEnergyInJoules = (double)x.GpuEnergyInJoules,
                Iteration = x.Iteration,
                StartTemperature = (double)x.PackageTemperatureBegin,
                StartTime = x.BeginTime
            };
        }

        public static Sample MapToTimeSeries(Dictionary<string, double> data)
        {
            var dram = GetValueOrDefaultFromDictionary(data, "dram");
            var elapsed = GetValueOrDefaultFromDictionary(data, "elapsed");
            var package = GetValueOrDefaultFromDictionary(data, "package-0");
            var uncore = GetValueOrDefaultFromDictionary(data, "uncore");
            var runningDram = GetValueOrDefaultFromDictionary(data, "running_dram");
            var runningCore = GetValueOrDefaultFromDictionary(data, "running_core");
            var runninUncore = GetValueOrDefaultFromDictionary(data, "running_uncore");
            var runningPackage = GetValueOrDefaultFromDictionary(data, "running_package-0");
            
            return new Sample()
            {
                DramEnergyInJoules = dram,
                ElapsedTime = elapsed,
                CpuEnergyInJoules = package,
                GpuEnergyInJoules = uncore,
                PackageTemperature = 0,
                CpuUtilization = 0,
                ProcessorPowerWatt = 0,
                AdditionalMetadata = new Dictionary<string, double>()
                {
                    { "total_dram",  runningDram },
                    { "total_core",  runningCore },
                    { "total_uncore",  runninUncore },
                    { "total_package",  runningPackage },
                }
            };
        }
        
        private static double GetValueOrDefaultFromDictionary(Dictionary<string, double> lastSample, string key)
        {
            var value = 0d;
            if (lastSample.TryGetValue(key, out var v))
            {
                value = v;
            }

            return value;
        }
    }
}
