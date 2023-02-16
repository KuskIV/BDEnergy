using BDEnergyFramework.Utils;
using BDEnergyFramework.Validators;

var dutService = DutUtils.GetDutService();

UIUtils.IntroduceFramework();

var config = ConfigUtils.GetConfiguration(dutService); // TODO: Consider burnin period as optional parameter

if (ConfigurationValidator.IsValid(config, dutService, out var errors))
{
    UIUtils.ShowMeasurementConfiguration(config);

}
else
{
    UIUtils.PrintErrors(errors);
}

UIUtils.EndFramework();


