using BDEnergyFramework.Models;
using BDEnergyFramework.Models.Internal;
using BDEnergyFramework.Parsers;
using BDEnergyFramework.Utils;
using CsvHelper;
using System;
using System.Collections.Generic;
using System.Formats.Asn1;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Timers;

namespace BDEnergyFramework.MeasuringInstruments
{
    public class IntelPowerGadget : MeasuringInstrument
    {
        [DllImport("EnergyLib64.dll", CharSet = CharSet.Unicode)]
        private static extern bool IntelEnergyLibInitialize();

        [DllImport("EnergyLib64.dll", CharSet = CharSet.Unicode)]
        private static extern bool ReadSample();

        [DllImport("EnergyLib64.dll", CharSet = CharSet.Unicode)]
        private static extern bool StartLog(string szFileName);

        [DllImport("EnergyLib64.dll", CharSet = CharSet.Unicode)]
        private static extern bool StopLog();
        
        public IntelPowerGadget(EMeasuringInstrument measuringInstrument) : base(measuringInstrument)
        {
            /*
             * 
             * Fatal error. System.AccessViolationException: 
             * Attempted to read or write protected memory. 
             * This is often an indication that other memory is corrupt.
             * 
             */

            Initialise();
        }

        internal override void StopMeasuringInstrument()
        {
            var success = StopLog();
            EnsureSuccess(success);
        }

        internal override void StartMeasuringInstruments(string path)
        {
            var success = StartLog(path);
            EnsureSuccess(success);
        }

        internal override void PerformMeasuring(object sender, ElapsedEventArgs e)
        {
            var success = ReadSample();
            EnsureSuccess(success);
        }

        internal override (TimeSeries, Measurement) ParseData(string path, DateTime startTime, DateTime endTime, long elapsedMilliseconds, double startTemperature, double endTemperature, int iteration)
        {
            var (ipgData, igpTimeSeries) = IntelPowerGadgetParser.Parse(path);

            var measurement = Mapper.Map(ipgData, startTime, endTime, elapsedMilliseconds, startTemperature, endTemperature, iteration);
            var timeSeries = Mapper.Map(igpTimeSeries);


            return (timeSeries, measurement);
        }

        private static void Initialise()
        {
            var success = IntelEnergyLibInitialize();
            EnsureSuccess(success);
        }

        private static void EnsureSuccess(bool success, [CallerMemberName] string callerName = "")
        {
            if (!success)
            {
                throw new Exception($"IntelPowerGadget failed to {callerName}");
            }
        }
    }
}
