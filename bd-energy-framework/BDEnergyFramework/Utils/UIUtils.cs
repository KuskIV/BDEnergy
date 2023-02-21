using BDEnergyFramework.Models;
using Spectre.Console;

namespace BDEnergyFramework.Utils
{
    internal class UIUtils
    {
        private static readonly int DefaultMeasurementCount = 10;
        private static readonly int DefaultAllocatedCores = -1;
        private static readonly int DefaultBurnInPeriod = 0;
        private static readonly int DefaultMeasurementsBetweenRestart = -1;
        private static readonly int DefaultMinimumTemperature = -200;
        private static readonly int DefaultMaximumTemperature = 200;

        public static void IntroduceFramework()
        {
            AnsiConsole.Write(
                new FigletText("BDEnergy Tool")
                    .Centered()
                    .Color(Color.Red));

            var rule = new Rule();
            AnsiConsole.Write(rule);
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
            table.AddColumn("Name");
            table.AddColumn(new TableColumn("Value").Centered());

            // Add some rows
            table.AddRow("Measurement Instruments", string.Join(',', config.MeasurementInstruments));
            table.AddRow("Measurements", config.RequiredMeasurements.ToString());
            table.AddRow("Test Case Path", string.Join(',', config.TestCasePaths));
            table.AddRow("Test Case Parameters", string.Join(',', config.TestCaseParameters));
            table.AddRow("Threads", config.AllocatedCores == -1 ? "Not specified" : config.AllocatedCores.ToString());
            table.AddRow("Upload to DB", config.UploadToDatabase ? "Yes" : "No");
            table.AddRow("Burn-in", config.BurnInPeriod.ToString());
            table.AddRow("PackageTemperature", "between" + config.MinimumTemperature.ToString() + " and " + config.MaximumTemperature.ToString());

            foreach (var key in config.AdditionalMetadata.Keys)
            {
                table.AddRow(key, config.AdditionalMetadata[key]);
            }

            if (config.RequiresRestarts)
            {
                table.AddRow("Measurements between restarts", config.MeasurementsBetweenRestarts.ToString());
            }
            else
            {
                table.AddRow("Device Restarts", "No");

            }

            AnsiConsole.Write(table);
        }

        public static MeasurementConfiguration GetConfiguration(List<EMeasuringInstrument> measuringInstruments)
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

            if (ShouldDutRestart())
            {
                sampelsBetweenRestarts = GetSampelsBetweenRestarts();
            }

            var minimumTemperature = GetMinimumTemperature();
            var maximumTemperature = GetMaximumTemperature();
            int? allocatedCores = GetAllocatedCores();

            return new MeasurementConfiguration(
                MeasurementInstruments: Mapper.MapToMeasuringInstrumentEnum(selectedMeasuringInstruments),
                RequiredMeasurements: requiredMeasurements,
                MeasurementsBetweenRestarts: sampelsBetweenRestarts,
                TestCasePaths: testCasePaths,
                AllocatedCores: ParseAllocatedCores(allocatedCores),
                TestCaseParameters: testCaseParameters,
                BurnInPeriod: burnInPeriod,
                UploadToDatabase: uploadToDatabase,
                MaximumTemperature: maximumTemperature,
                MinimumTemperature: minimumTemperature,
                DisableWifi:disableWifi,
                AdditionalMetadata: new Dictionary<string, string>());
        }

        private static bool GetDisableWifi()
        {
            return AnsiConsole.Confirm("Should the WIFI be disabled during the measurements?");
        }

        private static bool ShouldDutRestart()
        {
            return AnsiConsole.Confirm("Should the test include restarts of the device?");
        }

        private static int ParseAllocatedCores(int? allocatedCores)
        {
            if (allocatedCores is int cores && cores > 0)
            {
                return cores;
            }

            return -1;
        }

        private static int? GetAllocatedCores()
        {
            return AnsiConsole.Prompt(
                new TextPrompt<int?>("[grey][[Optional]][/] How many [green]threads should the test case execute on?[/]?")
                    .DefaultValue(null)
                    .ShowDefaultValue(false));
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

        private static MeasurementConfiguration GetDefaultConfiguration(List<string> testCasePaths, List<string> testCaseParameters, bool uploadToDatabase, List<string> selectedMeasuringInstruments, bool disableWifi)
        {
            return new MeasurementConfiguration(
                MeasurementInstruments: Mapper.MapToMeasuringInstrumentEnum(selectedMeasuringInstruments),
                RequiredMeasurements: DefaultMeasurementCount,
                MeasurementsBetweenRestarts: DefaultMeasurementsBetweenRestart,
                TestCasePaths: testCasePaths,
                AllocatedCores: DefaultAllocatedCores,
                TestCaseParameters: testCaseParameters,
                BurnInPeriod: DefaultBurnInPeriod,
                UploadToDatabase: uploadToDatabase,
                MinimumTemperature: DefaultMinimumTemperature,
                MaximumTemperature: DefaultMaximumTemperature,
                DisableWifi:disableWifi,
                AdditionalMetadata: new Dictionary<string, string>());
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

        private static int GetSampelsBetweenRestarts()
        {
            // how often should it restart?
            return AnsiConsole.Ask<int>("How many sampels should be obtained between restarts?");
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
            AnsiConsole.Write("The results are as following:\n");

            foreach (var m in measurements)
            {
                ShowMeasurement(m);
            }
        }

        private static void ShowMeasurement(MeasurementContext measurement)
        {
            var table = new Table();

            table.AddColumn("Name");
            table.AddColumn(new TableColumn("Value").Centered());

            table.AddRow("Test case", PathUtils.GetFilenameFromPath(measurement.TestCase));
            table.AddRow("Parameters", measurement.Parameter);
            table.AddRow("Measurement instrument", measurement.MeasurementInstrument.ToString());
            table.AddRow("Measurements", measurement.Measurements.Count().ToString());
            table.AddRow("Dram Energy (j)", MathUtils.GetMinMaxAvgStdAsString(measurement.Measurements.Select(x => x.DramEnergyInJoules).ToList()));
            table.AddRow("GPU Energy (j)", MathUtils.GetMinMaxAvgStdAsString(measurement.Measurements.Select(x => x.GpuEnergyInJoules).ToList()));
            table.AddRow("CPU Energy (j)", MathUtils.GetMinMaxAvgStdAsString(measurement.Measurements.Select(x => x.ProcessorEnergyInJoules).ToList()));
            table.AddRow("Duration (s)", MathUtils.GetMinMaxAvgStdAsString(measurement.Measurements.Select(x => x.Duration).ToList()));


            AnsiConsole.Write(table);
        }
    }
}
