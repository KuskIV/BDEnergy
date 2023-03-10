using BDEnergyFramework.Models;
using BDEnergyFramework.Models.Dto;
using BDEnergyFramework.Models.Internal;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.Extensions.Configuration;
using MySql.Data.MySqlClient;
using MySqlX.XDevAPI.Common;
using Newtonsoft.Json;
using Org.BouncyCastle.Asn1.Mozilla;
using RaspberryEnergyProcessing.Model;
using RaspberryPiCommunication;
using Spectre.Console.Rendering;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics.Metrics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Timers;
using static Mysqlx.Expect.Open.Types.Condition.Types;

namespace BDEnergyFramework.MeasuringInstruments
{


    public class Clamp : MeasuringInstrument
    {
        IConfiguration config;
        public Clamp(EMeasuringInstrument measuringInstrument) : base(measuringInstrument)
        {
            config = new ConfigurationBuilder()
                .AddUserSecrets<Program>()
                .AddJsonFile("Secrets/appsettings.secrets.json", true)
                .Build();
        }

        internal override void StartMeasuringInstruments(string path) 
        {
        }

        internal override void StopMeasuringInstrument()
        {
            Thread.Sleep(TimeSpan.FromSeconds(15));
        }

        internal override (TimeSeries, Models.Internal.Measurement) ParseData(string path, DateTime startTime, DateTime endTime, long elapsedMilliseconds, double startTemperature, double endTemperature, int iteration)
        {
            var results = FetchResults(path, startTime,endTime);
            TimeSeries timeSeries = new TimeSeries();
            Models.Internal.Measurement measurement = new Models.Internal.Measurement();
            foreach (var item in results)
            {
                timeSeries.Sampels.Add(new Sample
                {
                    CpuEnergyInJoules = ConvertToJoule(item.C1TrueRMS),
                    ElapsedTime = (double)(item.Time-startTime).TotalMilliseconds,
                    AdditionalMetadata = new Dictionary<string, double>(),
                    CpuUtilization = 0,
                    DramEnergyInJoules = 0,
                    GpuEnergyInJoules= 0,
                    PackageTemperature = 0,
                    ProcessorPowerWatt = 0,
                });
            }
            var resJ = results.Select(x => ConvertToJoule(x.C1TrueRMS));
            measurement.StartTime = startTime;
            measurement.EndTime = endTime;
            measurement.CpuEnergyInJoules = resJ.Sum();
            measurement.Duration = elapsedMilliseconds;
            measurement.AdditionalMetadata.Add("Min", resJ.Min());
            measurement.AdditionalMetadata.Add("Max", resJ.Max());
            measurement.Iteration= iteration;
            return (timeSeries, measurement);
        }
        public List<DtoClampPoint> FetchResults(string key, DateTime startTime, DateTime endTime)
        {
            List<DtoClampPoint> points = new List<DtoClampPoint>();
            using (MySqlConnection connection = new MySqlConnection(config["MySqlConnection"]))
            {
                connection.Open();

                string formattedStartTime = startTime.ToString("yyyy-MM-dd HH:mm:ss.fff");
                string formattedEndTime = endTime.ToString("yyyy-MM-dd HH:mm:ss.fff");

                MySqlCommand command = new MySqlCommand();
                command.Connection = connection;
                command.CommandText = "SELECT * FROM Measurements WHERE time BETWEEN @start AND @end";
                command.Parameters.AddWithValue("@start", formattedStartTime);
                command.Parameters.AddWithValue("@end", formattedEndTime);

                MySqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    points.Add(new DtoClampPoint
                    {
                        C1ACRMS = (double)reader[2],
                        C1TrueRMS = (double)reader[1],
                        Time = DateTime.Parse(reader[3].ToString())
                    });
                }
                reader.Close();

                if (points.Count == 0)
                {
                    throw new Exception("No data points were found for the specified time range.");
                }

                connection.Close();

                return points;

            }
        }
        private double ConvertToJoule(double measurement) 
        {
            return measurement * 1 * 230;
        }

        internal override void PerformMeasuring(object sender, ElapsedEventArgs e)
        {
            // do nothing
        }
    }
}