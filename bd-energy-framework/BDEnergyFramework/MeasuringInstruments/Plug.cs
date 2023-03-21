using BDEnergyFramework.Models.Dto;
using BDEnergyFramework.Models.Internal;
using BDEnergyFramework.Models;
using Microsoft.Extensions.Configuration;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Timers;
using static Org.BouncyCastle.Math.EC.ECCurve;
using BDEnergyFramework.Exceptions;

namespace BDEnergyFramework.MeasuringInstruments
{
    public class Plug : MeasuringInstrument
    {
        IConfiguration config;
        string machineName;
        public Plug(EMeasuringInstrument measuringInstrument) : base(measuringInstrument)
        {
            config = new ConfigurationBuilder()
                .AddUserSecrets<Program>()
                .AddJsonFile("Secrets/appsettings.secrets.json", true)
                .Build();
            machineName = Environment.MachineName;
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
            var results = FetchResults(path, startTime, endTime);
            TimeSeries timeSeries = new TimeSeries();
            Models.Internal.Measurement measurement = new Models.Internal.Measurement();
            foreach (var item in results)
            {
                timeSeries.Sampels.Add(new Sample
                {
                    CpuEnergyInJoules = item.Watt,
                    ElapsedTime = (double)(item.Time - startTime).TotalMilliseconds,
                    AdditionalMetadata = new Dictionary<string, double>(),
                    CpuUtilization = 0,
                    DramEnergyInJoules = 0,
                    GpuEnergyInJoules = 0,
                    PackageTemperature = 0,
                    ProcessorPowerWatt = 0,
                });
            }
            var resJ = results.Select(x => x.Watt);
            measurement.StartTime = startTime;
            measurement.EndTime = endTime;
            measurement.CpuEnergyInJoules = resJ.Sum();
            measurement.Duration = elapsedMilliseconds;
            measurement.AdditionalMetadata.Add("Min", resJ.Min());
            measurement.AdditionalMetadata.Add("Max", resJ.Max());
            measurement.Iteration = iteration;
            return (timeSeries, measurement);
        }
        public List<DtoPlugPoint> FetchResults(string key, DateTime startTime, DateTime endTime)
        {
            List<DtoPlugPoint> points = new List<DtoPlugPoint>();
            using (MySqlConnection connection = new MySqlConnection(config["MySqlConnection"]))
            {
                connection.Open();

                string formattedStartTime = startTime.ToString("yyyy-MM-dd HH:mm:ss.fff");
                string formattedEndTime = endTime.ToString("yyyy-MM-dd HH:mm:ss.fff");

                MySqlCommand command = new MySqlCommand();
                command.Connection = connection;
                command.CommandText = "SELECT * FROM power_usage WHERE time BETWEEN @start AND @end AND Ip = @ip";
                command.Parameters.AddWithValue("@start", formattedStartTime);
                command.Parameters.AddWithValue("@end", formattedEndTime);
                command.Parameters.AddWithValue("@ip", GetDeviceIp());

                MySqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    points.Add(new DtoPlugPoint
                    {
                        Watt = reader.GetInt32("Watt")/5,
                        Current = reader.GetFloat("Current"),
                        Voltage = reader.GetInt32("Voltage"),
                        Ip = reader.GetString("Ip"),
                        Time = reader.GetDateTime("time")
                });
                }
                reader.Close();

                if (points.Count == 0)
                {
                    throw new PlugQueryFoundNoPointsException();
                }

                connection.Close();

                return points;

            }
        }
        private string GetDeviceIp()
        {
            switch (machineName)
            {
                case "DESKTOP-IO08AJ7": // workstation one
                    return "192.168.1.182";
                default:
                    throw new Exception("Device does not have an assigned plug ip");
            }
        }

        internal override void PerformMeasuring(object sender, ElapsedEventArgs e)
        {
            // do nothing
        }
    }
}
