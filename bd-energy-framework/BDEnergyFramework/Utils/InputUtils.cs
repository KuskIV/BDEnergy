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

        public static List<MeasurementConfiguration> GetConfigurations(IDutService dutService, BdFramework.CommandSettings settings)
        {
            if (settings.Configuration is string config && InputIsValidPath(config))
            {
                return SerializeContentToConfiguration(config);
            }

            if (settings.TestCasePath is string testCasePath)
            {
                string defaultJsonPath = GetDefaultJsonPath();

                if (InputIsValidPath(defaultJsonPath))
                {
                    var configurations = SerializeContentToConfiguration(defaultJsonPath);

                    configurations.ForEach(x => x.TestCasePaths = new List<string>() { testCasePath });
                    configurations.ForEach(x => x.TestCaseParameters = new List<string>() { settings.TestCaseParameter });

                    return configurations;
                }
                else
                {
                    throw new ArgumentException("The default configuration either did not exist or is not valid format.");
                }
            }

            throw new ArgumentException($"Please provide either a valid '--testCasePath' (optional with '--testCaseParameter') or a '--config'");
        }

        private static string GetDefaultJsonPath()
        {
            var currentDir = Environment.ProcessPath;
            var dir = Path.GetDirectoryName(currentDir);
            var defaultJsonPath = Path.Combine(dir, "Json/default.json");
            return defaultJsonPath;
        }

        private static List<MeasurementConfiguration> SerializeInputToConfiguration(string input)
        {
            if (!HasValidStart(input) || !HasValidEnd(input))
            {
                throw new ArgumentException("The input content is not currentDir valid json.");
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
                throw new ArgumentException("The input should be currentDir Json file or Json path, not currentDir directory");
            }

            if (!File.Exists(input))
            {
                return false;
            }

            if (!input.ToLower().EndsWith(".json"))
            {
                throw new ArgumentException("The input file should be currentDir json file");
            }

            return true;
        }
    }
}
