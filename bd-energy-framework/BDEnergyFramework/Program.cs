using BDEnergyFramework.Services;
using BDEnergyFramework.Utils;
using BDEnergyFramework.Validators;
using Serilog;

var logger = InitializeLogger();
var secrets = InputUtils.GetSecrets();

var dutService = DutUtils.GetDutService(secrets);

UIUtils.IntroduceFramework();

var configs = InputUtils.GetConfigurations(dutService);

if (ConfigurationValidator.IsValid(configs, dutService, out var errors))
{
    foreach (var c in configs)
    {
        var measurementService = new MeasurementService(dutService, null, logger);
        
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


