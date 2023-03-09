using BDEnergyFramework.Models;
using BDEnergyFramework.Services;
using BDEnergyFramework.Utils;
using BDEnergyFramework.Validators;
using Serilog;
using Spectre.Console.Cli;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework
{
    public sealed class BdFramework : Command<BdFramework.CommandSettings>
    {
        public override int Execute([NotNull] CommandContext context, [NotNull] CommandSettings settings)
        {
            ProcessUtils.AssignPriorityToFramework();

            var logger = InitializeLogger();
            var secrets = InputUtils.GetSecrets();
            var dbConnectionFactory = GetDbConnectionFactory(secrets);

            var dutService = DutUtils.GetDutService(secrets, logger);

            UIUtils.IntroduceFramework();

            var configs = InputUtils.GetConfigurations(dutService, settings);

            if (ConfigurationValidator.IsValid(configs, dutService, out var errors))
            {
                foreach (var c in configs)
                {
                    var measurementService = new MeasurementService(dutService, dbConnectionFactory, logger, secrets.MachineName);

                    UIUtils.ShowMeasurementConfiguration(c);

                    var measurements = measurementService.PerformMeasurement(c);

                    UIUtils.ShowMeasurements(measurements);
                }
            }
            else
            {
                UIUtils.PrintErrors(errors);
            }

            UIUtils.EndFramework();

            Console.WriteLine("Press any key to close...");
            Console.Read();

            return 0;
        }

        public sealed class CommandSettings : Spectre.Console.Cli.CommandSettings
        {
            [CommandOption("--testCasePath")]
            public string? TestCasePath { get; set; }

            [CommandOption("--testCaseParameter")]
            [DefaultValue("")]
            public string TestCaseParameter { get; set; } = string.Empty;

            [CommandOption("--config")]
            public string? Configuration { get; set; }
        }

        private static ILogger InitializeLogger()
        {
            return new LoggerConfiguration()
            .MinimumLevel.Debug()
            .WriteTo.Console()
            .CreateLogger();
        }

        private static Func<IDbConnection> GetDbConnectionFactory(UserSecrets secrets)
        {
            var connectionString = secrets.ConnectionString;
            return () => {
                var con = new MySql.Data.MySqlClient.MySqlConnection(connectionString);
                con.Open();
                return con;
            };
        }

    }
}
