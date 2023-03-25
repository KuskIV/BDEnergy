using System;
using System.Collections.Generic;
using System.Diagnostics.Metrics;
using System.Linq;
using System.Text;
using System.Text.Json;
using MySql.Data.MySqlClient;
using System.Threading.Tasks;
using BBPlug.models;
using System.Net.NetworkInformation;
using Polly;

namespace RspMeasuringDevice
{
    public class DatabaseHandler
    {
        private readonly string DbConnectionStr;
        MySqlConnection connection;
        public DatabaseHandler(string dbConnection)
        {
            DbConnectionStr = dbConnection;
            connection = new MySqlConnection(DbConnectionStr);
        }

        public void ÓpenConnection() 
        {
            connection.Open();
        }

        public void CloseConnection() 
        {
            connection.Close();
        }

        public void InsertResults(PlugStatus result, string ip, int maxRetries = 30, int retryDelayMilliseconds = 1000)
        {
            Policy.Handle<Exception>()
                .WaitAndRetry(maxRetries, retryAttempt => TimeSpan.FromMilliseconds(retryDelayMilliseconds))
                .Execute(() =>
                {
                    using var command = new MySqlCommand("INSERT INTO power_usage (Watt, Current, Voltage, Ip, time) VALUES (@watt, @current, @voltage, @ip, @time)", connection);

                    // set parameter values
                    command.Parameters.AddWithValue("@watt", result.Power);
                    command.Parameters.AddWithValue("@current", result.Current);
                    command.Parameters.AddWithValue("@voltage", result.Voltage);
                    command.Parameters.AddWithValue("@ip", ip);
                    command.Parameters.AddWithValue("@time", DateTime.UtcNow.ToString("yyyy-MM-dd HH:mm:ss.fff"));
                    command.ExecuteNonQuery();
                });
        }

    }
}
