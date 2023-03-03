using BDEnergyFramework.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.Utils
{
    public static class ConfigUtils
    {
        private static readonly int DefaultMeasurementCount = 10;
        private static readonly List<List<int>> DefaultAllocatedCores = new List<List<int>>();
        private static readonly int DefaultBurnInPeriod = 0;
        private static readonly int DefaultMinimumTemperature = -200;
        private static readonly int DefaultMaximumTemperature = 200;
        private static readonly int DefaultExperimentNumber = 0;
        private static readonly string DefaultExperimentName = "EXPERIMENT_NAME";
        private static readonly string DefaultThreads = "";
        private static readonly string DefaultTestCaseType = "unspecified";
        private static readonly string DefaultCompliler = "unspecified";
        private static readonly string DefaultOptimizatinos = "unspecified";
        private static readonly string DefaultLanguage = "unspecified";
        private static readonly List<string> DefaultMeasuringInstrument = new List<string>() { MeasuringInstruments.IntelPowerGadget };


        public static List<MeasurementConfiguration> GetConfiguration(List<string> testCasePaths, List<string> testCaseParameters, List<List<int>> allocatedCores, 
            List<string?> measuringInstruments = null, int? measurementCount = null,
            int? burninPeriod = null, bool? uploadToDb = null, int? minTemp = null, int? maxTemp = null, bool? disableWifi = null,
            string? expName = null, int? expNumber = null, string? concurrencyLimit=null, string? testCaseType = null,
            string? compiler=null, string? optimizations = null, string? language = null, bool? stopBackgroundProcesses = null,
            Dictionary<string, string> additionalMetadata = null)
        {
            var defaultConfig = new MeasurementConfiguration()
            {
                MeasurementInstruments = measuringInstruments is List<string> mi ? Mapper.MapToMeasuringInstrumentEnum(measuringInstruments) : Mapper.MapToMeasuringInstrumentEnum(DefaultMeasuringInstrument),
                RequiredMeasurements = measurementCount is int ms ? ms : DefaultMeasurementCount,
                TestCasePaths = testCasePaths,
                AllocatedCores = allocatedCores,
                TestCaseParameters = testCaseParameters,
                BurnInPeriod = burninPeriod is int bp ? bp : DefaultBurnInPeriod,
                UploadToDatabase = uploadToDb is bool udb ? udb : false,
                MinimumTemperature = minTemp is int mit ? mit :  DefaultMinimumTemperature,
                MaximumTemperature = maxTemp is int mat ? mat : DefaultMaximumTemperature,
                DisableWifi = disableWifi is bool dw ? dw : false,
                ExperimentName = expName is string epn ? epn : DefaultExperimentName,
                ExperimentNumber = expNumber is int epnu ? epnu : DefaultExperimentNumber,
                ConcurrencyLimit = concurrencyLimit is string cl ? cl : DefaultThreads,
                TestCaseType = testCaseType is string tct ? tct : DefaultTestCaseType,
                Compiler = compiler is string c ? c : DefaultCompliler,
                Optimizations = optimizations is string o ? o : DefaultOptimizatinos,
                Language = language is string l ? l : DefaultLanguage,
                StopBackgroundProcesses = stopBackgroundProcesses is bool back ? back : false,
                AdditionalMetadata = additionalMetadata is null ? new Dictionary<string, string>() : additionalMetadata
            };

            return new List<MeasurementConfiguration>() { defaultConfig };
        }


        //public static List<MeasurementConfiguration> GetDefaultConfiguration(List<string> testCasePaths, List<string> testCaseParameters, bool uploadToDatabase, List<string> selectedMeasuringInstruments, bool disableWifi)
        //{
        //    var defaultConfig = new MeasurementConfiguration()
        //    {
        //        MeasurementInstruments = Mapper.MapToMeasuringInstrumentEnum(selectedMeasuringInstruments),
        //        RequiredMeasurements = DefaultMeasurementCount,
        //        TestCasePaths = testCasePaths,
        //        AllocatedCores = DefaultAllocatedCores,
        //        TestCaseParameters = testCaseParameters,
        //        BurnInPeriod = DefaultBurnInPeriod,
        //        UploadToDatabase = uploadToDatabase,
        //        MinimumTemperature = DefaultMinimumTemperature,
        //        MaximumTemperature = DefaultMaximumTemperature,
        //        DisableWifi = disableWifi,
        //        ExperimentName = DefaultExperimentName,
        //        ExperimentNumber = DefaultExperimentNumber,
        //        ConcurrencyLimit = DefaultThreads,
        //        TestCaseType = DefaultTestCaseType,
        //        Compiler = DefaultCompliler,
        //        Optimizations = DefaultOptimizatinos,
        //        Language = DefaultLanguage,
        //        StopBackgroundProcesses = false,
        //        AdditionalMetadata = new Dictionary<string, string>()
        //    };

        //    return new List<MeasurementConfiguration>() { defaultConfig };
        //}
    }
}
