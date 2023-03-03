using BDEnergyFramework.Models;
using Spectre.Console;
using Spectre.Console.Json;

namespace BDEnergyFramework.Utils
{
    internal class UIUtils
    {
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
