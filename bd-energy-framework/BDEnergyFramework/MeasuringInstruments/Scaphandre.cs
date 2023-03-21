using BDEnergyFramework.Exceptions;
using BDEnergyFramework.Models;
using BDEnergyFramework.Models.Internal;
using BDEnergyFramework.Parsers;
using BDEnergyFramework.Utils;
using Microsoft.Win32;
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
using ProcessorAffinityGenerator = BDEnergyFramework.Utils.ProcessorAffinityGenerator;
using MathUtils = BDEnergyFramework.Utils.MathUtils;

namespace BDEnergyFramework.MeasuringInstruments
{
    /// <summary>
    /// PC needs to be in testmode for scaphandre to work. 
    /// run in admin and then restart pc.
    /// bcdedit.exe -set TESTSIGNING ON
    /// </summary>
    internal class Scaphandre : MeasuringInstrument
    {
        private  int sampleRate = 100000000; //100000000 = 100ms

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
            string jsonPath = Path.ChangeExtension(path, "json");
            var cpuWatts = GetHostWatts(jsonPath);

            

            if(cpuWatts == null)
            {
                throw new ScaphandreFileNotFoundException();
            }
            else
            {
                var totalCpuJoules = CalculateTotalEnergyInJoules(cpuWatts, elapsedMilliseconds);


                // Parse the JSON file and get the process consumption for each measurement
                var processConsumptionPerMeasurement = GetProcessEnergyConsumptionPerMeasurement(jsonPath, elapsedMilliseconds);

                // Calculate the total consumption for individual process
                var totalProcessConsumption = GetTotalProcessConsumption(processConsumptionPerMeasurement);


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
                        CpuEnergyInJoules = MathUtils.ConvertWattToJoule(watt,cpuWatts.Count,elapsedMilliseconds),
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

                int dataPointCount = timeSeries.Sampels.Count();
                Console.WriteLine("Datapoints in timeseries: " + dataPointCount.ToString());

                return (timeSeries, measurement);
            }


        }
        internal override void PerformMeasuring(object sender, ElapsedEventArgs e)
        { 
            // Do nothing
        }

        internal override void StartMeasuringInstruments(string path)
        {
            
            string jsonPath = Path.ChangeExtension(path, "json");

            if (File.Exists(@"scaphandre.exe"))
            {
                //string nullDevicePath = Environment.OSVersion.Platform == PlatformID.Win32NT ? "NUL" : "/dev/null";
                //string scaphandreExecutable = Environment.OSVersion.Platform == PlatformID.Win32NT ? "scaphandre.exe" : "scaphandre";

                string appDirectory = AppDomain.CurrentDomain.BaseDirectory;

                var startInfo = new ProcessStartInfo
                {
                    CreateNoWindow = false,
                    FileName = @"scaphandre.exe",
                    //FileName = scaphandreExecutable,
                    //Arguments = $"json -t 5 -n 100000000 -f report.json", // -t measuring time, -n sample rate 100000000 = 100 ms, -f save to file.
                    //Arguments = $"json -n {sampleRate} -f report.json",
                    Arguments = $"json -n {sampleRate} -f {jsonPath}",
                    UseShellExecute = false,
                    WorkingDirectory = appDirectory,
                    RedirectStandardOutput = true,
                    RedirectStandardError = true,
                    StandardOutputEncoding = Encoding.UTF8,
                    StandardErrorEncoding = Encoding.UTF8,
                };
                var scapProcess = new Process { StartInfo = startInfo };
                scapProcess.OutputDataReceived += (sender, e) => { /* Discard output */ };
                scapProcess.ErrorDataReceived += (sender, e) => { /* Discard error */ };

                scapProcess.Start();
                //var processorAffinity = ProcessorAffinityGenerator.GenerateProcessorAffinity(new List<int> { 7 });
                //scapProcess.ProcessorAffinity = processorAffinity;
                scapProcess.PriorityClass = ProcessPriorityClass.High;

                // Either:
                // scapProcess.PrioirtyClass high and process.PrioroityCLass off in ProcessUtils. 19 - 26, 0 miss
                // resevere scapProcess for 1 core and not run test case on that core. 23 - 28, 0 miss

                scapProcess.BeginOutputReadLine();
                scapProcess.BeginErrorReadLine();


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

        public List<double> GetHostWatts(string jsonPath)
        {

            if (!File.Exists(jsonPath))
            {
                return null;
            }
            var json = File.ReadAllText(jsonPath);

            if (string.IsNullOrWhiteSpace(json))
            {
                return null;
            }

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
        public List<Dictionary<string, double>> GetProcessEnergyConsumptionPerMeasurement(string jsonPath, long duration)
        {
            var json = File.ReadAllText(jsonPath);
            var jsonArray = JArray.Parse(json);
            var processConsumptionPerMeasurement = new List<Dictionary<string, double>>();
            string folderToMatch = Path.Combine("BDEnergy", "test-cases"); // should work on Linux


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
                            double consumptionJoules = MathUtils.ConvertWattToJoule(consumption,jsonArray.Count, duration); // Converts from watts to joules

                            string processKey = $"{processName} (PID: {processId})";
                            processConsumption[processKey] = consumptionJoules;
                        }
                    }
                    processConsumptionPerMeasurement.Add(processConsumption);
                }
                return processConsumptionPerMeasurement;
            }
        }

        public Dictionary<string, double> GetTotalProcessConsumption(List<Dictionary<string, double>> processConsumptionPerMeasurement)
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
                .ToDictionary(kv => kv.Key, kv => kv.Value);
        }


        

        // This function is called for each measurement and should convert the value which is watts to joules.
        // This is to create a timeseries with the values in joules.
        // A measurement should be taken every 100 ms so that watts represents the watts for a 100 ms
        /*public double ConvertWattToJoules(double wattMeasurements)
        {
            double timeInSeconds = (double)GetMilisecondsBetweenSampels() /1000; // Convert nanoseconds to seconds
            double energyInJoules = wattMeasurements * timeInSeconds;
            return energyInJoules;

        }*/

        public double CalculateTotalEnergyInJoules(List<double> wattMeasurements, long duration)
        {
            double totalEnergyInJoules = 0;

            foreach (double wattMeasurement in wattMeasurements)
            {
                totalEnergyInJoules += MathUtils.ConvertWattToJoule(wattMeasurement, wattMeasurements.Count, duration);
            }

            return totalEnergyInJoules;
        }

    }
}
