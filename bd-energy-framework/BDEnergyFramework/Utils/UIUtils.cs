using BDEnergyFramework.Models;
using Spectre.Console;
using Spectre.Console.Json;

namespace BDEnergyFramework.Utils
{
    internal class UIUtils
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

        public static void IntroduceFramework()
        {
            AnsiConsole.Write(
                new FigletText("BDEnergy Tool")
                    .Centered()
                    .Color(Color.Red));

            var rule = new Rule();
            AnsiConsole.Write(rule);
        }

        public static List<MeasurementConfiguration> PromtForInput()
        {
            var defaultContext = GetDefaultConfiguration(
                new List<string>() { "PATH" },
                new List<string>() { "Parameter" },
                false,
                new List<string>() { "Intel Power Gadget" },
                false);

            var json = new JsonText(
                System.Text.Json.JsonSerializer.Serialize(defaultContext));

            AnsiConsole.Write(
                new Panel(json)
                    .Header("Please provide a path to a JSON of the following format as parameter")
                    .Collapse()
                    .RoundedBorder()
                    .BorderColor(Color.Yellow));

            return new List<MeasurementConfiguration>();
        }

        public static void PrintErrors(List<ValidationError> errors)
        {
            AnsiConsole.Write("Errors found in the input:\n");

            foreach (var e in errors)
            {
                AnsiConsole.Write(" - " + e.Message + "\n");
            }
        }

        public static void EndFramework()
        {
            var rule = new Rule("[red]BDEnergy Framework is about to shut down[/]");
            AnsiConsole.Write(rule);
        }

        public static void ShowMeasurementConfiguration(MeasurementConfiguration config)
        {
            AnsiConsole.Write("Valid input. Parameters are as following:\n");

            // Create a table
            var table = new Table();

            // Add some columns
            table.AddColumn("CollectionName");
            table.AddColumn(new TableColumn("Value").Centered());

            var cores = string.Join(',', config.AllocatedCores.Select(x => "(" + string.Join(',', x) + ")"));

            // Add some rows
            table.AddRow("Measurement Instruments", string.Join(',', config.MeasurementInstruments));
            table.AddRow("Measurements", config.RequiredMeasurements.ToString());
            table.AddRow("Test Case Path", string.Join(',', config.TestCasePaths));
            table.AddRow("Test Case Parameters", string.Join(',', config.TestCaseParameters));
            table.AddRow("Allocated cores", !config.AllocatedCores.Any() ? "Not specified" : cores);
            table.AddRow("Upload to DB", config.UploadToDatabase ? "Yes" : "No");
            table.AddRow("Burn-in", config.BurnInPeriod.ToString());
            table.AddRow("PackageTemperature", "between " + config.MinimumTemperature.ToString() + " and " + config.MaximumTemperature.ToString());

            foreach (var key in config.AdditionalMetadata.Keys)
            {
                table.AddRow(key, config.AdditionalMetadata[key]);
            }

            AnsiConsole.Write(table);
        }

        public static List<MeasurementConfiguration> GetConfiguration(List<EMeasuringInstrument> measuringInstruments)
        {
            var sampelsBetweenRestarts = -1;

            var testCasePaths = GetTestCasePaths();
            var testCaseParameters = GetTestCaseParameters(testCasePaths);
            var selectedMeasuringInstruments = GetSelectedMeasuringInstruments(measuringInstruments);
            var uploadToDatabase = GetUploadToDatabase();
            var disableWifi = GetDisableWifi();

            if (ShouldUseDefaults())
            {
                return GetDefaultConfiguration(testCasePaths, testCaseParameters, uploadToDatabase, selectedMeasuringInstruments, disableWifi);
            }

            var burnInPeriod = GetBurnInPeriod();
            int requiredMeasurements = GetMeasurementCount();

            var minimumTemperature = GetMinimumTemperature();
            var maximumTemperature = GetMaximumTemperature();
            var allocatedCores = GetAllocatedCores();

            var config =  new MeasurementConfiguration(
                MeasurementInstruments: Mapper.MapToMeasuringInstrumentEnum(selectedMeasuringInstruments),
                RequiredMeasurements: requiredMeasurements,
                TestCasePaths: testCasePaths,
                AllocatedCores: ParseAllocatedCores(allocatedCores),
                TestCaseParameters: testCaseParameters,
                BurnInPeriod: burnInPeriod,
                UploadToDatabase: uploadToDatabase,
                MaximumTemperature: maximumTemperature,
                MinimumTemperature: minimumTemperature,
                DisableWifi: disableWifi,
                ExperimentName: DefaultExperimentName,
                ExperimentNumber : DefaultExperimentNumber,
                ConcurrencyLimit:DefaultThreads,
                TestCaseType:DefaultTestCaseType,
                Compiler:DefaultCompliler,
                Optimizations:DefaultOptimizatinos,
                Language:DefaultLanguage,
                StopBackgroundProcesses:false,
                AdditionalMetadata: new Dictionary<string, string>());

            return new List<MeasurementConfiguration>() { config };

        }

        private static bool GetDisableWifi()
        {
            return AnsiConsole.Confirm("Should the WIFI be disabled during the measurements?");
        }

        private static List<List<int>> ParseAllocatedCores(string allocatedCores)
        {
            if (allocatedCores.ToLower() == "all")
            {
                return new List<List<int>>();
            }

            var cores = allocatedCores.Split(',');

            return new List<List<int>>()
            {
                cores.Select(x => int.Parse(x.Trim())).ToList()
            };
        }

        private static string GetAllocatedCores()
        {
            return AnsiConsole.Prompt(
                new TextPrompt<string>("[grey][[Optional]][/] What cores should the test case execute on (comma seperated)?")
                    .DefaultValue("All"));
        }

        private static int GetMeasurementCount()
        {
            return AnsiConsole.Ask<int>("How many [green]sampels are required[/]?");
        }

        private static int GetMaximumTemperature()
        {
            return AnsiConsole.Ask<int>("What maximum temperature should the divice not get above?");

        }

        private static int GetMinimumTemperature()
        {
            return AnsiConsole.Ask<int>("What minimum temperature should the divice not get below?");
        }

        private static List<MeasurementConfiguration> GetDefaultConfiguration(List<string> testCasePaths, List<string> testCaseParameters, bool uploadToDatabase, List<string> selectedMeasuringInstruments, bool disableWifi)
        {
            var defaultConfig =  new MeasurementConfiguration(
                MeasurementInstruments: Mapper.MapToMeasuringInstrumentEnum(selectedMeasuringInstruments),
                RequiredMeasurements: DefaultMeasurementCount,
                TestCasePaths: testCasePaths,
                AllocatedCores: DefaultAllocatedCores,
                TestCaseParameters: testCaseParameters,
                BurnInPeriod: DefaultBurnInPeriod,
                UploadToDatabase: uploadToDatabase,
                MinimumTemperature: DefaultMinimumTemperature,
                MaximumTemperature: DefaultMaximumTemperature,
                DisableWifi:disableWifi,
                ExperimentName: DefaultExperimentName,
                ExperimentNumber: DefaultExperimentNumber,
                ConcurrencyLimit: DefaultThreads,
                TestCaseType: DefaultTestCaseType,
                Compiler: DefaultCompliler,
                Optimizations: DefaultOptimizatinos,
                Language: DefaultLanguage,
                StopBackgroundProcesses:false,
                AdditionalMetadata: new Dictionary<string, string>());

            return new List<MeasurementConfiguration>() { defaultConfig };
        }

        private static bool ShouldUseDefaults()
        {
            return AnsiConsole.Confirm("Use default parameters?");
        }

        private static bool GetUploadToDatabase()
        {
            return AnsiConsole.Confirm("Should the results be uploaded to the database?");
        }

        private static int GetBurnInPeriod()
        {
            return AnsiConsole.Ask<int>("How many of the first sampels should be used as burn-in?");
        }

        private static List<string> GetTestCaseParameters(List<string> testCasePaths)
        {
            var parameterForTestCases = new List<string>();

            foreach ( var p in testCasePaths) 
            { 
                parameterForTestCases.Add(
                    AnsiConsole.Ask<string>($"What are the [green]parameters[/] for the test case {p}?"));
            }

            return parameterForTestCases;
        }

        private static List<string> GetTestCasePaths()
        {
            var commaSeperatedPaths = AnsiConsole.Ask<string>("What are the [green]path[/] for the test case (comma seperated)?");

            var paths = commaSeperatedPaths.Split(',').ToList();
            
            paths = paths.Select(x => x.Trim()).ToList();
            paths = paths.Select(x => x.Trim('"')).ToList();

            return paths;
        }

        private static List<string> GetSelectedMeasuringInstruments(List<EMeasuringInstrument> measuringInstrumentEnums)
        {
            var measuringInstruments = Mapper.MapFromMeasuringInstrumentEnum(measuringInstrumentEnums);

            return AnsiConsole.Prompt(
                new MultiSelectionPrompt<string>()
                    .Title("What [green]measuring instruments should be used?[/]?")
                    .NotRequired()
                    .PageSize(10)
                    .MoreChoicesText("[grey](Move up and down to reveal more measuring instruments)[/]")
                    .InstructionsText(
                        "[grey](Press [blue]<space>[/] to toggle a measuring instrument, " +
                        "[green]<enter>[/] to accept)[/]")
                    .AddChoices(measuringInstruments));
        }

        internal static void ShowMeasurements(List<MeasurementContext> measurements)
        {
            if (!measurements.Any())
            {
                AnsiConsole.Write("No results found.\n");
            }
            else
            {
                AnsiConsole.Write("The results are as following:\n");

                foreach (var m in measurements)
                {
                    ShowMeasurement(m);
                }
            }
        }

        private static void ShowMeasurement(MeasurementContext measurement)
        {
            var table = new Table();

            table.AddColumn("CollectionName");
            table.AddColumn(new TableColumn("Value").Centered());

            table.AddRow("Test case", PathUtils.GetFilenameFromPath(measurement.TestCase));
            table.AddRow("Parameters", measurement.Parameter);
            table.AddRow("Measurement instrument", measurement.MeasurementInstrument.ToString());
            table.AddRow("Measurements", measurement.Measurements.Count().ToString());
            table.AddRow("Dram Energy (j)", MathUtils.GetMinMaxAvgStdAsString(measurement.Measurements.Select(x => x.DramEnergyInJoules).ToList()));
            table.AddRow("GPU Energy (j)", MathUtils.GetMinMaxAvgStdAsString(measurement.Measurements.Select(x => x.GpuEnergyInJoules).ToList()));
            table.AddRow("CPU Energy (j)", MathUtils.GetMinMaxAvgStdAsString(measurement.Measurements.Select(x => x.CpuEnergyInJoules).ToList()));
            table.AddRow("Duration (s)", MathUtils.GetMinMaxAvgStdAsString(measurement.Measurements.Select(x => x.Duration).ToList()));


            AnsiConsole.Write(table);
        }
    }
}
