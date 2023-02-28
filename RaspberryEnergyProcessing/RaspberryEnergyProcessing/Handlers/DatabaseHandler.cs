using MySql.Data.MySqlClient;
using Mysqlx.Crud;
using RaspberryEnergyProcessing.Model;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace RaspberryEnergyProcessing.Handlers
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

        public void InsertResults(List<Measurement> results) 
        {
            try
            {
                connection.Open();

                string experimentId = "experiment_1";
                DateTime startTime = results.FirstOrDefault().time;
                DateTime endTime = results.LastOrDefault().time;
                string timerSeries = JsonSerializer.Serialize(results);
                double sum = results.Sum(x => x.C1TrueRMS);
                double min = results.Min(x => x.C1TrueRMS);
                double max = results.Max(x => x.C1TrueRMS);
                int duration = (int)(endTime - startTime).TotalMilliseconds;

                string query = "INSERT INTO experiment_data (start_time, end_time, experiment_id, timer_series, sum, min, max, duration) VALUES (@start_time, @end_time, @experiment_id, @timer_series, @sum, @min, @max, @duration)";
                MySqlCommand command = new MySqlCommand(query, connection);
                command.Parameters.AddWithValue("@start_time", startTime.ToString("yyyy-MM-dd HH:mm:ss.fff"));
                command.Parameters.AddWithValue("@end_time", endTime.ToString("yyyy-MM-dd HH:mm:ss.fff"));
                command.Parameters.AddWithValue("@experiment_id", experimentId);
                command.Parameters.AddWithValue("@timer_series", timerSeries);
                command.Parameters.AddWithValue("@sum", sum);
                command.Parameters.AddWithValue("@min", min);
                command.Parameters.AddWithValue("@max", max);
                command.Parameters.AddWithValue("@duration", duration);

                int rowsAffected = command.ExecuteNonQuery();
                Console.WriteLine("Rows affected: {0}", rowsAffected);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: {0}", ex.Message);
            }
            finally
            {
                connection.Close();
            }
        }

    }
}
