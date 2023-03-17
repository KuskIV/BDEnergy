using BDEnergyFramework.Models;
using BDEnergyFramework.Models.Internal;
using BDEnergyFramework.Utils;
using Microsoft.VisualBasic;
using Org.BouncyCastle.Asn1.Mozilla;
using Timer = System.Timers.Timer;

namespace BDEnergyFramework.MeasuringInstruments
{
    public class MeasuringInstrument
    {
        private Timer _timer;
        private readonly int _milisecondsBetweenSampels = 500;
        private readonly EMeasuringInstrument _measuringInstrument;

        public MeasuringInstrument(EMeasuringInstrument measuringInstrument)
        {
            _measuringInstrument = measuringInstrument;
        }

        public EMeasuringInstrument GetName()
        {
            return _measuringInstrument;
        }

        internal virtual int GetMilisecondsBetweenSampels()
        {
            return _milisecondsBetweenSampels;
        }

        public (TimeSeries, Measurement) GetMeasurement(DateTime startTime, DateTime endTime, long elapsedMilliseconds, double startTemperature, double endTemperature, int iteration, bool burninApplied)
        {
            if (!burninApplied)
            {
                return (new TimeSeries(), new Measurement());
            }

            var path = PathUtils.GetResultPathForMeasuringInstrument(_measuringInstrument, startTime);

            return ParseData(path, startTime, endTime, elapsedMilliseconds, startTemperature, endTemperature, iteration);
        }

        public void Start(DateTime fileCreatingTime)
        {
            var path = PathUtils.GetResultPathForMeasuringInstrument(_measuringInstrument, fileCreatingTime);

            StartMeasuringInstruments(path);

            _timer = new Timer(GetMilisecondsBetweenSampels());
            _timer.Elapsed += PerformMeasuring;
            _timer.Enabled = true;
        }

        public void Stop(DateTime date)
        {
            _timer.Enabled = false;

            StopMeasuringInstrument();
        }

        internal virtual (TimeSeries, Measurement) ParseData(string path, DateTime startTime, DateTime endTime, long elapsedMilliseconds, double startTemperature, double endTemperature, int iteration)
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
