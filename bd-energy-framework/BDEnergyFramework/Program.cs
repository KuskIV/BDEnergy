using BDEnergyFramework.Models;
using BDEnergyFramework.Services;
using BDEnergyFramework.Utils;
using BDEnergyFramework.Validators;
using Serilog;
using System.Data;

var logger = InitializeLogger();
var secrets = InputUtils.GetSecrets();
var dbConnectionFactory = GetDbConnectionFactory(secrets);

var dutService = DutUtils.GetDutService(secrets);

UIUtils.IntroduceFramework();

var configs = InputUtils.GetConfigurations(dutService);

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

ILogger InitializeLogger()
{
    return new LoggerConfiguration()
    .MinimumLevel.Debug()
    .WriteTo.Console()
    .CreateLogger();
}

Func<IDbConnection> GetDbConnectionFactory(UserSecrets secrets)
{
    var connectionString = secrets.ConnectionString;
    return () => {
        var con = new MySql.Data.MySqlClient.MySqlConnection(connectionString);
        con.Open();
        return con;
    };
}


