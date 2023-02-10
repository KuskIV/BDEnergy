using BDEnergyFramework.Models;
using Spectre.Console;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.Utils
{
    internal class UIUtils
    {
        public static void ShowMeasurementConfiguration(MeasurementCollectionConfiguration config)
        {
            // Create a table
            var table = new Table();

            // Add some columns
            table.AddColumn("Name");
            table.AddColumn(new TableColumn("Value").Centered());

            // Add some rows
            table.AddRow("Measurement Instruments", string.Join(',', config.MeasurementInstruments));
            table.AddRow("Measurements", config.RequiredMeasurements.ToString());
            table.AddRow("Test Case Path", config.TestCasePath);
            table.AddRow("Threads", config.ThreadsToExecuteOn == -1 ? "Not specified" : config.ThreadsToExecuteOn.ToString());

            if (config.ReqiresRestarts)
            {
                table.AddRow("Measurements between restarts", config.SampelsBetweenRestart.ToString());
            }
            else
            {
                table.AddRow("Device Restarts", "No");

            }

            AnsiConsole.Write(table);
        }

        public static MeasurementCollectionConfiguration GetConfiguration(List<string> measuringInstruments)
        {
            var sampelsBetweenRestarts = -1;
            var testCasePath = "";
            
            // measuring instruments
            var selectedMeasuringInstruments = UIUtils.GetSelectedMeasuringInstruments(measuringInstruments);

            // how many sampels?
            var requiredMeasurements = AnsiConsole.Ask<int>("How many [green]sampels are required[/]?");

            // should it restart?
            if (AnsiConsole.Confirm("Should the test include restarts of the device?"))
            {
                // how often should it restart?
                sampelsBetweenRestarts = AnsiConsole.Ask<int>("How many sampels should be obtained between restarts?");
            }

            var p = AnsiConsole.Prompt(
                new TextPrompt<int?>("[grey][[Optional]][/] How many [green]threads should the test case execute on?[/]?")
                    .DefaultValue(null)
                    .ShowDefaultValue(false));

            return new MeasurementCollectionConfiguration(
                MeasurementInstruments: selectedMeasuringInstruments,
                RequiredMeasurements: requiredMeasurements,
                SampelsBetweenRestart: sampelsBetweenRestarts,
                TestCasePath: testCasePath,
                ThreadsToExecuteOn:p ?? -1);
        }

        public static void IntroduceFramework()
        {
            AnsiConsole.Write(
                new FigletText("DBEnergy Tool")
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
    }
}
