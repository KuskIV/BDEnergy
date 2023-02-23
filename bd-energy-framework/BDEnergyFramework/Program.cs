using BDEnergyFramework.Services;
using BDEnergyFramework.Utils;
using BDEnergyFramework.Validators;
using Serilog;

var logger = InitializeLogger();
var secrets = InputUtils.GetSecrets();

var dutService = DutUtils.GetDutService(secrets);
var measurementService = new MeasurementService(dutService, null, logger);

UIUtils.IntroduceFramework();

var config = InputUtils.GetConfiguration(dutService);

if (ConfigurationValidator.IsValid(config, dutService, out var errors))
{
    UIUtils.ShowMeasurementConfiguration(config);

    var measurements = measurementService.PerformMeasurement(config);

    UIUtils.ShowMeasurements(measurements);
}
else
{
    UIUtils.PrintErrors(errors);
}

UIUtils.EndFramework();

Console.Read();

ILogger InitializeLogger()
{
    return new LoggerConfiguration()
    .MinimumLevel.Debug()
    .WriteTo.Console()
    .CreateLogger();
}


