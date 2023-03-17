using BDEnergyFramework.Models;
using BDEnergyFramework.Models.Internal;
using BDEnergyFramework.Parsers;
using BDEnergyFramework.Utils;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Org.BouncyCastle.Asn1.X509;
using Spectre.Console.Json.Syntax;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Diagnostics.Metrics;
using System.IO;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using System.Timers;
using Measurement = BDEnergyFramework.Models.Internal.Measurement;

namespace BDEnergyFramework.MeasuringInstruments
{
    internal class Scaphandre : MeasuringInstrument, IDisposable
    {
        private  int sampleRate = 100000000;

        //private string jsonPath = @"c:\Measuring instrument\scaphandre-main\target\release\report.json";
        public Scaphandre(EMeasuringInstrument measuringInstrument) : base(measuringInstrument)
        {
        }
        internal override int GetMilisecondsBetweenSampels()
        {
            return sampleRate / 1_000_000;
        }
        internal override (TimeSeries, Measurement) ParseData(string path, DateTime startTime, DateTime endTime, long elapsedMilliseconds, double startTemperature, double endTemperature, int iteration)
        {
            var cpuWatts = GetHostWatts(path);
            var totalCpuJoules = CalculateTotalEnergyInJoules(cpuWatts);
            string jsonPath = Path.ChangeExtension(path, "json");


            // Parse the JSON file and get the process consumption for each measurement
            var processConsumptionPerMeasurement = GetProcessEnergyConsumptionPerMeasurement(jsonPath, 10);
            //Console.WriteLine(processConsumptionPerMeasurement.ToString());

            // Calculate the total consumption for the top 10 processes
            var totalProcessConsumption = GetTotalProcessConsumption(processConsumptionPerMeasurement, 10);


            // Measurement contains to total joules over the whole test case measurement
            var measurement = new Measurement()
            {

                DramEnergyInJoules = 0,
                CpuEnergyInJoules = totalCpuJoules,
                GpuEnergyInJoules = 0,
                StartTime = startTime,
                EndTime = endTime,
                StartTemperature = startTemperature,
                EndTemperature = endTemperature,
                Iteration = iteration,
                Duration = elapsedMilliseconds,
                // Include data from individual processes
                AdditionalMetadata = totalProcessConsumption
            };

            // Timeseries should have a timeseries of each measurement within the measurement for the whole test case.
            // Timeseries consists of Sample
            var samples = new List<Sample>();

            for (int i = 0; i < cpuWatts.Count; i++)
            {
                var watt = cpuWatts[i];

                var sample = new Sample()
                {
                    CpuEnergyInJoules = ConvertWattToJoules(watt),
                    PackageTemperature = 0,
                    ElapsedTime = 0,
                    ProcessorPowerWatt = 0,
                    DramEnergyInJoules = 0,
                    GpuEnergyInJoules = 0,
                    CpuUtilization = 0,
                    // Include data from individual processes
                    AdditionalMetadata = processConsumptionPerMeasurement[i]
                };

                samples.Add(sample);
            }

            var timeSeries = new TimeSeries()
            {
                Sampels = samples
            };

            // Sort the timeseries data based on consumption in descending order
            

           /* // Get the top consumer
            var topConsumer = totalProcessConsumption.FirstOrDefault();

            // Print  the top consumer
            if (!topConsumer.Equals(default(KeyValuePair<string, double>)))
            {
                Console.WriteLine($"Top consumer: {topConsumer.Key}");
                Console.WriteLine($"Total Consumption: {topConsumer.Value}");
            }
            else
            {
                Console.WriteLine("No data available.");
            }*/

            return (timeSeries, measurement);
        }
        internal override void PerformMeasuring(object sender, ElapsedEventArgs e)
        {
        }

        internal override void StartMeasuringInstruments(string path)
        {
            //Console.WriteLine(path);
            string jsonPath = Path.ChangeExtension(path, "json");
            Console.WriteLine(jsonPath);

            // TODO: less hardcoded path
            if (File.Exists(@"scaphandre.exe"))
            {
                string nullDevicePath = Environment.OSVersion.Platform == PlatformID.Win32NT ? "NUL" : "/dev/null";
                var startInfo = new ProcessStartInfo
                {
                    CreateNoWindow = false,
                    FileName = @"scaphandre.exe",
                    //Arguments = $"json -t 5 -n 100000000 -f report.json", // -t measuring time, -n sample rate 100000000 = 100 ms, -f save to file.
                    //Arguments = $"json -n {sampleRate} -f report.json",
                    Arguments = $"json -n {sampleRate} -f {jsonPath}",
                    UseShellExecute = false,
                    WorkingDirectory = @"C:\Measuring instrument", /// NOT correct, but might not be used
                    RedirectStandardOutput = true,
                    RedirectStandardError = true,
                    StandardOutputEncoding = Encoding.UTF8,
                    StandardErrorEncoding = Encoding.UTF8,
                };
                var scapProcess = new Process { StartInfo = startInfo };
                scapProcess.OutputDataReceived += (sender, e) => { /* Discard output */ };
                scapProcess.ErrorDataReceived += (sender, e) => { /* Discard error */ };

                scapProcess.Start();
                scapProcess.BeginOutputReadLine();
                scapProcess.BeginErrorReadLine();

                // Wait for the process to exit or perform any necessary actions
                // ...

                scapProcess.CancelOutputRead();
                scapProcess.CancelErrorRead();
                
            }
            else
            {
                Console.WriteLine("Scaphande.exe not found");
            }
            
        }

        internal override void StopMeasuringInstrument()
        {
            var processes = Process.GetProcessesByName("scaphandre");
            foreach (var process in processes)
            {
                process.Kill();
            }
            //Console.WriteLine("Scaphandre killed");
        }

        public List<double> GetHostWatts(string path)
        {
            string jsonPath = Path.ChangeExtension(path, "json");

            var json = File.ReadAllText(jsonPath);
            JsonTextReader reader = new JsonTextReader(new StringReader(json));
            var hostConsumption = new List<double>();
            while (reader.Read())
            {
                if (reader.Value != null && reader.Value.ToString() == "host")
                {
                    // Move to the start of the host object
                    reader.Read();

                    // Read through the properties of the host object
                    while (reader.Read() && reader.TokenType != JsonToken.EndObject)
                    {
                        if (reader.Value != null && reader.Value.ToString() == "consumption")
                        {
                            reader.Read(); // move to the value
                            hostConsumption.Add((double)reader.Value / 1000000.0); // Convert from micro watts to watts.
                        }
                    }
                }

            }
            return hostConsumption;
        }


        // Get energy consumption for individual processes.
        // Modify to only get for programs in the test case folder.
        public List<Dictionary<string, double>> GetProcessEnergyConsumptionPerMeasurement(string jsonPath, int topN = 10)
        {
            var json = File.ReadAllText(jsonPath);
            var jsonArray = JArray.Parse(json);
            var processConsumptionPerMeasurement = new List<Dictionary<string, double>>();
            string folderToMatch = "BDEnergy\\test-cases";

            using (JsonTextReader reader = new JsonTextReader(new StringReader(json)))
            {
                foreach (var measurement in jsonArray)
                {
                    var processConsumption = new Dictionary<string, double>();

                    foreach (var process in measurement["consumers"])
                    {
                        string processPath = process["exe"].ToString();

                        if (processPath.Contains(folderToMatch))
                        {
                            string processName = Path.GetFileName(processPath);
                            string processId = process["pid"].ToString();
                            double consumption = (double)process["consumption"] / 1000000.0; // Convert from micro watts to watts.
                            double consumptionJoules = ConvertWattToJoules(consumption); // Converts from watts to joules

                            string processKey = $"{processName} (PID: {processId})";
                            processConsumption[processKey] = consumptionJoules;
                        }
                    }
                    processConsumptionPerMeasurement.Add(processConsumption);
                }
                return processConsumptionPerMeasurement;
            }
        }

        public Dictionary<string, double> GetTotalProcessConsumption(List<Dictionary<string, double>> processConsumptionPerMeasurement, int topN = 10)
        {
            var totalConsumption = new Dictionary<string, double>();

            foreach (var processConsumption in processConsumptionPerMeasurement)
            {
                foreach (var process in processConsumption)
                {
                    if (totalConsumption.ContainsKey(process.Key))
                    {
                        totalConsumption[process.Key] += process.Value;
                    }
                    else
                    {
                        totalConsumption[process.Key] = process.Value;
                    }
                }
            }

            return totalConsumption
                .OrderByDescending(kv => kv.Value)
                .Take(topN)
                .ToDictionary(kv => kv.Key, kv => kv.Value);
        }


        public double ConvertWattsLstToJoules(List<double> wattMeasurements, long durationInMilliseconds)
        {
            // Convert duration to seconds
            double durationInSeconds = durationInMilliseconds / 1000.0;

            // Calculate the average power in watts
            double averagePower = wattMeasurements.Average(); // TODO: Empty list, System.InvalidOperationException

            // Calculate the energy used in joules using the formula: energy = power * time
            double totalEnergyInJoules = averagePower * durationInSeconds;

            return totalEnergyInJoules;
        }

        // This function is called for each measurement and should convert the value which is watts to joules.
        // This is to create a timeseries with the values in joules.
        // A measurement should be taken every 100 ms so that watts represents the watts for a 100 ms
        public double ConvertWattToJoules(double wattMeasurements)
        {
            double timeInSeconds = (double)GetMilisecondsBetweenSampels() /1000; // Convert nanoseconds to seconds
            double energyInJoules = wattMeasurements * timeInSeconds;
            return energyInJoules;

        }

        public double CalculateTotalEnergyInJoules(List<double> wattMeasurements)
        {
            double totalEnergyInJoules = 0;

            foreach (double wattMeasurement in wattMeasurements)
            {
                totalEnergyInJoules += ConvertWattToJoules(wattMeasurement);
            }

            return totalEnergyInJoules;
        }



        public void Dispose()
        {
        }
    }
}
