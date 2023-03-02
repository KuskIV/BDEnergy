using BDEnergyFramework.Models;
using BDEnergyFramework.Models.Internal;
using BDEnergyFramework.Utils;
using Org.BouncyCastle.Asn1.Mozilla;
using Timer = System.Timers.Timer;

namespace BDEnergyFramework.MeasuringInstruments
{
    public class MeasuringInstrument
    {
        private Timer _timer;
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

        internal virtual int GetMilisecondsBetweenSampels()
        {
            return _milisecondsBetweenSampels;
        }

        public (TimeSeries, Measurement) GetMeasurement(DateTime startTime, DateTime endTime, long elapsedMilliseconds, double startTemperature, double endTemperature, int iteration)
        {
            var path = PathUtils.GetResultPathForMeasuringInstrument(_measuringInstrument, startTime);

            return ParseData(path, startTime, endTime, elapsedMilliseconds, startTemperature, endTemperature, iteration);
        }

        public void Start(DateTime date)
        {
            var path = PathUtils.GetResultPathForMeasuringInstrument(_measuringInstrument, date);

            StartMeasuringInstruments(path);

            _timer = new Timer(GetMilisecondsBetweenSampels());
            _timer.Elapsed += PerformMeasuring;
            _timer.Enabled = true;
        }

        public void Stop(DateTime date)
        {
            _timer.Enabled = false;

            Thread.Sleep(TimeSpan.FromMilliseconds(10));

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
