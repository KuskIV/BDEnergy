using BDEnergyFramework.Models;
using BDEnergyFramework.Utils;
using Microsoft.VisualBasic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.MeasuringInstruments
{
    public class MeasuringInstrument
    {
        private System.Timers.Timer _timer;
        private readonly int _milisecondsBetweenSampels = 100;
        private readonly EMeasuringInstrument _measuringInstrument;

        public MeasuringInstrument(EMeasuringInstrument measuringInstrument)
        {
            _measuringInstrument = measuringInstrument;
        }

        public EMeasuringInstrument GetName()
        {
            return _measuringInstrument;
        }

        public (TimeSeries, Measurement) GetMeasurement(DateTime startTime, DateTime endTime, long elapsedMilliseconds)
        {
            var path = PathUtils.GetResultPathForMeasuringInstrument(_measuringInstrument, startTime);

            return ParseData(path, startTime, endTime, elapsedMilliseconds);


        }

        public void Start(DateTime date)
        {
            var path = PathUtils.GetResultPathForMeasuringInstrument(_measuringInstrument, date);

            StartMeasuringInstruments(path);

            _timer = new System.Timers.Timer(_milisecondsBetweenSampels);
            _timer.Elapsed += PerformMeasuring;
            _timer.Enabled = true;
        }

        public void Stop(DateTime date)
        {
            _timer.Enabled = false;

            StopMeasuringInstrument();
        }

        internal virtual (TimeSeries, Measurement) ParseData(string path, DateTime startTime, DateTime endTime, long elapsedMilliseconds)
        {
            throw new NotImplementedException();
        }

        internal virtual void StopMeasuringInstrument()
        {
            throw new NotImplementedException();
        }

        internal virtual void StartMeasuringInstruments(string path)
        {
            throw new NotImplementedException();
        }

        internal virtual void PerformMeasuring(object sender, System.Timers.ElapsedEventArgs e)
        {
            throw new NotImplementedException();
        }
    }
}
