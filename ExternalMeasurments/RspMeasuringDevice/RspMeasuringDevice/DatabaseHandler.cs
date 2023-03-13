using System;
using System.Collections.Generic;
using System.Diagnostics.Metrics;
using System.Linq;
using System.Text;
using System.Text.Json;
using MySql.Data.MySqlClient;
using System.Threading.Tasks;

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
        public void InsertResults(List<Measurement> results)
        {
            string insertQuery = "INSERT INTO Measurements (TRms,Rms,Time) VALUES (@double1, @double2, @timestamp)";
            try
            {
                foreach (Measurement measurement in results) 
                {
                    MySqlCommand command = new MySqlCommand(insertQuery, connection);
                    command.Parameters.AddWithValue("@double1", measurement.C1TrueRMS);
                    command.Parameters.AddWithValue("@double2", measurement.C1ACRMS);
                    command.Parameters.AddWithValue("@timestamp", measurement.time);
                    int rowsAffected = command.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: {0}", ex.Message);
            }
            finally
            {
                Console.WriteLine("File succesfully uploaded");
            }
        }

    }
}
