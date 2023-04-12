using System;
using System.Collections.Generic;
using System.Diagnostics.Metrics;
using System.Linq;
using System.Text;
using System.Text.Json;
using MySql.Data.MySqlClient;
using System.Threading.Tasks;
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
        public async Task InsertResults(List<Measurement> results)
        {
            string insertQuery = "INSERT INTO Measurements (TRms,Rms,Time) VALUES (@double1, @double2, @timestamp)";
            int maxRetries = 30;
            int retryDelayMs = 1000;

            var retryPolicy = Policy
                .Handle<Exception>()
                .WaitAndRetryAsync(maxRetries, i => TimeSpan.FromMilliseconds(retryDelayMs * i));

            try
            {
                await retryPolicy.ExecuteAsync(async () =>
                {
                    foreach (Measurement measurement in results)
                    {
                        MySqlCommand command = new MySqlCommand(insertQuery, connection);
                        command.Parameters.AddWithValue("@double1", measurement.C1TrueRMS);
                        command.Parameters.AddWithValue("@double2", measurement.C1ACRMS);
                        command.Parameters.AddWithValue("@timestamp", measurement.time.ToUniversalTime());
                        int rowsAffected = await command.ExecuteNonQueryAsync();
                    }
                });
            }
            catch (MySqlException ex) when (ex.Number == 0 || ex.Number == 2013)
            {
                // Connection is closed or lost, reopen it and retry operation
                Console.WriteLine("Connection lost or closed, retrying operation...");
                connection.Close();
                connection.Open();
                await InsertResults(results);
            }
            catch (Exception ex)
            {
                // Handle other exceptions
                Console.WriteLine("Error: {0}", ex.Message);
            }
            finally
            {
                Console.WriteLine($"File successfully uploaded at {DateTime.UtcNow.ToUniversalTime()}");
            }

        }

    }
}
