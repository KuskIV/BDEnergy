using BDEnergyFramework.Models;
using Spectre.Console;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.Utils
{
    internal class UIUtils
    {
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

        public static MeasurementConfiguration GetConfiguration(List<string> measuringInstruments)
        {
            var sampelsBetweenRestarts = -1;

            var testCasePaths = GetTestCasePaths();

            var testCaseParameters = GetTestCaseParameters(testCasePaths);

            // TODO: Allocated specific cores?

            // TODO: Additional metadata?

            // measuring instruments
            var selectedMeasuringInstruments = GetSelectedMeasuringInstruments(measuringInstruments);

            // how many sampels?
            var requiredMeasurements = AnsiConsole.Ask<int>("How many [green]sampels are required[/]?");

            // should it restart?
            if (AnsiConsole.Confirm("Should the test include restarts of the device?"))
            {
                sampelsBetweenRestarts = GetSampelsBetweenRestarts();
            }

            var allocatedCores = AnsiConsole.Prompt(
                new TextPrompt<int?>("[grey][[Optional]][/] How many [green]threads should the test case execute on?[/]?")
                    .DefaultValue(null)
                    .ShowDefaultValue(false));

            return new MeasurementConfiguration(
                MeasurementInstruments: selectedMeasuringInstruments,
                RequiredMeasurements: requiredMeasurements,
                MeasurementsBetweenRestarts: sampelsBetweenRestarts,
                TestCasePaths: testCasePaths,
                AllocatedCores:allocatedCores ?? -1,
                TestCaseParameters:testCaseParameters,
                AdditionalMetadata: new Dictionary<string, string>());
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

            paths.ForEach(x => x.Trim());

            return paths;
        }

        public static void IntroduceFramework()
        {
            AnsiConsole.Write(
                new FigletText("BDEnergy Tool")
                    .Centered()
                    .Color(Color.Red));

            var rule = new Rule();
            AnsiConsole.Write(rule);
        }

        public static List<string> GetSelectedMeasuringInstruments(List<string> measuringInstruments)
        {
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

        internal static void PrintErrors(List<ValidationError> errors)
        {
            AnsiConsole.Write("Errors found in the input:\n");

            foreach (var e in errors)
            {
                AnsiConsole.Write(" - " + e.Message + "\n");
            }
        }

        internal static void EndFramework()
        {
            var rule = new Rule("[red]BDEnergy Framework is about to shut down[/]");
            AnsiConsole.Write(rule);
        }
    }
}
