// See https://aka.ms/new-console-template for more information
using BDEnergyFramework.Utils;
using Spectre.Console;

var measuringInstruments = new List<string>() { "RAPL", "Intel Power Gadget", "E3" };

UIUtils.IntroduceFramework();

var config = UIUtils.GetConfiguration(measuringInstruments);

UIUtils.ShowMeasurementConfiguration(config);

