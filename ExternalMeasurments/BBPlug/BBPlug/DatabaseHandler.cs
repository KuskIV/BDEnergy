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
using MySqlX.XDevAPI.Common;

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

        public void ÓpenConnection(int maxRetries = 30, int retryDelayMilliseconds = 1000) 
        {
            try
            {
                Policy.Handle<Exception>()
                    .WaitAndRetry(maxRetries, retryAttempt => TimeSpan.FromMilliseconds(retryDelayMilliseconds))
                    .Execute(() =>
                    {
                        connection.Open();
                    });
            }
            catch (Exception ex)
            {
                // Handle the exception here, for example by logging it or displaying an error message to the user.
                Console.WriteLine("An exception occurred: " + ex.Message);
            }
        }

        public void CloseConnection() 
        {
            connection.Close();
        }

        public async Task InsertResults(PlugStatus result, string ip)
        {
            int maxRetries = 300;
            int retryDelayMilliseconds = 1000;
            try
            {
                Policy.Handle<Exception>()
                    .WaitAndRetry(maxRetries, retryAttempt => TimeSpan.FromMilliseconds(retryDelayMilliseconds))
                    .Execute(() =>
                    {
                        using var command = new MySqlCommand("INSERT INTO power_usage (Watt, Current, Voltage, Ip, time, React, Apparent, PowFactor) VALUES (@watt, @current, @voltage, @ip, @time, @React, @Apparent, @PowFactor)", connection);

                        // set parameter values
                        command.Parameters.AddWithValue("@watt", result.Power);
                        command.Parameters.AddWithValue("@current", result.Current);
                        command.Parameters.AddWithValue("@voltage", result.Voltage);
                        command.Parameters.AddWithValue("@ip", ip);
                        command.Parameters.AddWithValue("@time", DateTime.UtcNow.ToString("yyyy-MM-dd HH:mm:ss.fff"));
                        command.Parameters.AddWithValue("@React", result.ReactivePower);
                        command.Parameters.AddWithValue("@Apparent", result.ApparentPower);
                        command.Parameters.AddWithValue("@PowFactor", result.PowerFactor);
                        command.ExecuteNonQuery();
                    });
            }
             catch (MySqlException ex) when (ex.Number == 0 || ex.Number == 2013)
            {
                // Connection is closed or lost, reopen it and retry operation
                Console.WriteLine("Connection lost or closed, retrying operation...");
                connection.Close();
                connection.Open();
                await InsertResults(result, ip);
            }
            catch (Exception ex)
            {
                // Handle other exceptions
                Console.WriteLine("Error: {0}", ex.Message);
            }
        }

    }
}
