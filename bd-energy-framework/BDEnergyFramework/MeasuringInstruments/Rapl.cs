using BDEnergyFramework.Models;
using BDEnergyFramework.Models.Internal;
using System.Timers;

namespace BDEnergyFramework.MeasuringInstruments;

public class Rapl : MeasuringInstrument
{
    public Rapl(EMeasuringInstrument measuringInstrument) : base(measuringInstrument)
    {
    }

    internal override (TimeSeries, Measurement) ParseData(string path, DateTime startTime, DateTime endTime, long elapsedMilliseconds, double startTemperature, double endTemperature, int iteration)
    {
        return base.ParseData(path, startTime, endTime, elapsedMilliseconds, startTemperature, endTemperature, iteration);
    }

    internal override void PerformMeasuring(object sender, ElapsedEventArgs e)
    {
        base.PerformMeasuring(sender, e);
    }

    internal override void StartMeasuringInstruments(string path)
    {
        base.StartMeasuringInstruments(path);
    }

    internal override void StopMeasuringInstrument()
    {
        base.StopMeasuringInstrument();
    }
}