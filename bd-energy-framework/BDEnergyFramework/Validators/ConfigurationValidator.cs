using BDEnergyFramework.Models;
using BDEnergyFramework.Services;
using Spectre.Console;

namespace BDEnergyFramework.Validators
{
    public static class ConfigurationValidator
    {
        public static bool IsValid(MeasurementConfiguration configuration, IDutService dutService, out List<ValidationError> errors)
        {
            errors = new List<ValidationError>();

            ValidateMeasuringInstruments(dutService, configuration.MeasurementInstruments, errors);
            ValidateMeasurements(configuration, errors);
            ValidatePaths(configuration.TestCasePaths, errors);
            ValidateTestCases(configuration, errors);
            ValidateTemperatures(configuration, errors);

            return !errors.Any();
        }

        private static void ValidateTemperatures(MeasurementConfiguration configuration, List<ValidationError> errors)
        {
            if (configuration.MinimumTemperature == configuration.MaximumTemperature)
            {
                errors.Add(
                    new ValidationError($"The minimum temperature {(configuration.MinimumTemperature)} should not be equal to the maximum temperature ({configuration.MaximumTemperature})"));
            }

            if (configuration.MinimumTemperature > configuration.MaximumTemperature)
            {
                errors.Add(
                    new ValidationError($"The minimum temperature {(configuration.MinimumTemperature)} should not be larger than the maximum temperature ({configuration.MaximumTemperature})"));
            }
        }

        private static void ValidateTestCases(MeasurementConfiguration configuration, List<ValidationError> errors)
        {
            int pathCount = configuration.TestCasePaths.Count();
            int parameterCount = configuration.TestCaseParameters.Count();

            if (pathCount < parameterCount)
            {
                errors.Add(
                    new ValidationError($"There are too many parameters ({parameterCount}) compared to paths ({pathCount})"));
            }

            else if (pathCount > parameterCount)
            {
                errors.Add(
                    new ValidationError($"There are too many paths ({pathCount}) compared to parameters ({parameterCount})"));
            }
        }

        private static void ValidatePaths(List<string> paths, List<ValidationError> errors)
        {
            foreach (var p in paths)
            {
                if (!File.Exists(p))
                {
                    errors.Add(
                        new ValidationError($"'{p}' is not a valid path"));

                    continue;
                }

                if (!IsExecutable(p))
                {
                    errors.Add(
                        new ValidationError($"'{p}' is not an executable (.exe)"));
                }
            }
        }

        private static bool IsExecutable(string p)
        {
            return p.Trim().ToLower().EndsWith(".exe");
        }

        private static void ValidateMeasurements(MeasurementConfiguration configuration, List<ValidationError> errors)
        {
            int measurementsBetweenRestarts = configuration.MeasurementsBetweenRestarts;
            int measurements = configuration.RequiredMeasurements;
            int burnin = configuration.RequiredMeasurements;

            if (measurementsBetweenRestarts > measurements)
            {
                errors.Add(
                    new ValidationError($"Measurements between restart ({measurementsBetweenRestarts}) cannot exceed measurements ({measurements})"));
            }
        }

        private static void ValidateMeasuringInstruments(IDutService dutService, List<EMeasuringInstrument> measurementInstruments, List<ValidationError> errors)
        {
            foreach (var mi in measurementInstruments)
            {
                if (!IsMeasuringInstrumentValid(dutService, mi))
                {
                    errors.Add(
                        new ValidationError($"Measuring instrument '{mi}' is not valid for OS {dutService.GetOperatingSystem()}"));
                }
            }
        }

        private static bool IsMeasuringInstrumentValid(IDutService dutService, EMeasuringInstrument mi)
        {
            return dutService.GetMeasuringInstruments().Any(x => mi == x);
        }
    }
}
