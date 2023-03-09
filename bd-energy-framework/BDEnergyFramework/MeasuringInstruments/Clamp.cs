using BDEnergyFramework.Models;
using BDEnergyFramework.Models.Dto;
using BDEnergyFramework.Models.Internal;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.Extensions.Configuration;
using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using Org.BouncyCastle.Asn1.Mozilla;
using RaspberryEnergyProcessing.Model;
using RaspberryPiCommunication;
using Spectre.Console.Rendering;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Mysqlx.Expect.Open.Types.Condition.Types;

namespace BDEnergyFramework.MeasuringInstruments
{


    public class Clamp : MeasuringInstrument
    {
        private const string _deviceString = "rasp";
        private const string baseUrl = @"https://stemlevelup/api/Values/";
        IConfiguration config;
        public Clamp(EMeasuringInstrument measuringInstrument) : base(measuringInstrument)
        {
            config = new ConfigurationBuilder()
                .AddUserSecrets<Program>()
                .Build();
        }

        internal override void StartMeasuringInstruments(string path) 
        {
            SetValues(Modes.reset).GetAwaiter().GetResult();
            using (HttpClient client = new HttpClient())
            {
                string url = $"{baseUrl}api/updatekey?id={_deviceString}&key={path}"; //Set expId
                HttpResponseMessage response = client.GetAsync(url).GetAwaiter().GetResult();
            }
            SetValues(Modes.startSignal).GetAwaiter().GetResult();
            while (true)
            {
                if (GetStarted().GetAwaiter().GetResult()) 
                {
                    break;
                }
            }
        }

        internal override void StopMeasuringInstrument()
        {
            SetValues(Modes.stopSignal).GetAwaiter().GetResult();
            while (true)
            {
                if (GetStopped().GetAwaiter().GetResult())
                {
                    break;
                }
            }
        }


        private async Task SetValues(Modes mode)
        {
            using (HttpClient client = new HttpClient())
            {
                string url = $"{baseUrl}api/updatestatus?id={_deviceString}&mode={mode}";
                HttpResponseMessage response = await client.GetAsync(url);
            }
        }

        public async Task<bool> GetStarted()
        {
            using (HttpClient client = new HttpClient())
            {
                string url = $"{baseUrl}{_deviceString}";
                HttpResponseMessage response = await client.GetAsync(url);

                if (response.IsSuccessStatusCode)
                {
                    string content = await response.Content.ReadAsStringAsync();
                    DtoBody data = JsonConvert.DeserializeObject<DtoBody>(content);

                    return data.Started;
                }
                else
                {
                    return false;
                }
            }
        }

        public async Task<bool> GetStopped()
        {
            using (HttpClient client = new HttpClient())
            {
                string url = $"{baseUrl}{_deviceString}";
                HttpResponseMessage response = await client.GetAsync(url);

                if (response.IsSuccessStatusCode)
                {
                    string content = await response.Content.ReadAsStringAsync();
                    DtoBody data = JsonConvert.DeserializeObject<DtoBody>(content);

                    return data.Ended;
                }
                else
                {
                    return false;
                }
            }
        }

        internal override (TimeSeries, Models.Internal.Measurement) ParseData(string path, DateTime startTime, DateTime endTime, long elapsedMilliseconds, double startTemperature, double endTemperature, int iteration)
        {
            var results = FetchResults(path);
            TimeSeries timeseries = results.Item1;
            Models.Internal.Measurement measurement = results.Item2;
            measurement.Iteration= iteration;
            return (timeseries, measurement);
        }
        public (TimeSeries, Models.Internal.Measurement) FetchResults(string key) 
        {
            TimeSeries timeSeries = new TimeSeries();
            Models.Internal.Measurement measurement = new();
            using (MySqlConnection connection = new MySqlConnection(config["ConnectionStrings:MySqlConnection"]))
            {
                connection.Open();

                string query = "SELECT * FROM `experiment_data` WHERE experiment_id = @key";

                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@key", key);

                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            List<DtoDataPoint> dataPoints = JsonConvert.DeserializeObject<List<DtoDataPoint>>((string)reader[3]);//Time_Series
                            DateTime StartTime = DateTime.Parse((string)reader[0]); //Start_Time
                            DateTime EndTime = DateTime.Parse((string)reader[1]);
                            foreach (var point in dataPoints)
                            {
                                TimeSpan elapsedTime = (point.Time - StartTime);
                                timeSeries.Sampels.Add(new Sample()
                                {
                                    ElapsedTime = elapsedTime.TotalMilliseconds,
                                    CpuEnergyInJoules = point.C1TrueRMS
                                });
                            }
                            measurement.StartTime = StartTime;
                            measurement.EndTime = EndTime;
                            measurement.CpuEnergyInJoules = (double)reader[4];
                            measurement.Duration = (long)reader[7];
                            measurement.AdditionalMetadata.Add("Min", (double)reader[5]);
                            measurement.AdditionalMetadata.Add("Max", (double)reader[6]);

                        }
                    }
                }
            }
            return (timeSeries, measurement);

        }
    }
}
