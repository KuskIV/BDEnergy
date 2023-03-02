﻿using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RaspberryEnergyProcessing.Model
{
    public class Measurements
    {
        public DateTime TimeStamp { get; set; }
        public List<Measurement> measurements { get; set; }

        public Measurements(DateTime dateTime,string rawMeasurement)
        {
            TimeStamp = dateTime;
            measurements = LoadMeasurement(rawMeasurement);
            AddTimeStamps();
        }

        private List<Measurement> LoadMeasurement(string rawStr) 
        {
            string[] lines = rawStr.Split('\n', StringSplitOptions.RemoveEmptyEntries);
            string[] headers = lines[0].Split(',');

            List<Measurement> measurements = new List<Measurement>();
            for (int i = 1; i < lines.Length; i++)
            {
                string[] values = lines[i].Split(',');
                Measurement measurement = new Measurement();
                measurement.C1TrueRMS = double.Parse(values[0], CultureInfo.InvariantCulture);
                measurement.C1ACRMS = double.Parse(values[1], CultureInfo.InvariantCulture);
                measurements.Add(measurement);
            }
            return measurements;
        }
        private DateTime AddTimeStamp(int i) 
        {
            return TimeStamp.AddMilliseconds(i*100);
        }

        private void AddTimeStamps() 
        {
            for (int i = 0; i < measurements.Count; i++)
            {
                measurements[i].time = AddTimeStamp(i-measurements.Count);
            }
        }
    }
}
