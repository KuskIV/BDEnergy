using BDEnergyFramework.Models;
using BDEnergyFramework.Services;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace BDEnergyFramework.Utils
{
    public static class InputUtils
    {
        public static UserSecrets GetSecrets()
        {
            var builder = new ConfigurationBuilder()
                .AddUserSecrets<Program>()
                .AddJsonFile("Secrets/appsettings.secrets.json", true)
                .AddJsonFile("appsettings.json", true);

            var configurationRoot = builder.Build();

            var wifiAdapterName = configurationRoot.GetValue<string>("WifiAdapterName");
            var machineName = configurationRoot.GetValue<string>("MachineName");
            var connectionString = configurationRoot.GetValue<string>("ConnectionString");

            if (wifiAdapterName is string w && machineName is string m && connectionString is string c)
            {
                return new UserSecrets(
                    WifiAdapterName:w,
                    MachineName:m,
                    ConnectionString:c);
            }

            throw new ArgumentException($"Not all usesecrets are set: WifiAdapterName '{wifiAdapterName}', MachineName '{machineName}', ConnectionString '{connectionString}'");
        }

        public static List<MeasurementConfiguration> GetConfigurations(IDutService dutService)
        {
            var arguments = Environment.GetCommandLineArgs();
            var measuringInstruments = dutService.GetMeasuringInstruments();

            if (arguments.Count() == 1)
            {
                return UIUtils.PromtForInput();
                //return UIUtils.GetConfiguration(measuringInstruments);
            }

            if (arguments.Count() > 2)
            {
                throw new ArgumentException("The framework can only be called with one parameter");
            }

            var input = arguments.Last();

            if (InputIsValidPath(input))
            {
                return SerializeContentToConfiguration(input);
            }

            throw new ArgumentException($"The parameter {input} is invalid. It should be a path to a valid json.");
        }

        private static List<MeasurementConfiguration> SerializeInputToConfiguration(string input)
        {
            if (!HasValidStart(input) || !HasValidEnd(input))
            {
                throw new ArgumentException("The input content is not a valid json.");
            }

            try
            {
                return JsonSerializer.Deserialize<List<MeasurementConfiguration>>(input);
            }
            catch (Exception)
            {
                throw;
            }
        }

        private static bool HasValidEnd(string input)
        {
            var endsWithBracket = input.Trim().EndsWith(']');

            return endsWithBracket;
        }

        private static bool HasValidStart(string input)
        {
            var startWithCurleyBracket = input.Trim().StartsWith('[');

            return startWithCurleyBracket;
        }

        private static List<MeasurementConfiguration> SerializeContentToConfiguration(string path)
        {
            var content = System.IO.File.ReadAllText(path);

            return SerializeInputToConfiguration(content);
        }

        private static bool InputIsValidPath(string input)
        {
            if (Directory.Exists(input))
            {
                throw new ArgumentException("The input should be a Json file or Json path, not a directory");
            }

            if (!File.Exists(input))
            {
                return false;
            }

            if (!input.ToLower().EndsWith(".json"))
            {
                throw new ArgumentException("The input file should be a json file");
            }

            return true;
        }
    }
}
