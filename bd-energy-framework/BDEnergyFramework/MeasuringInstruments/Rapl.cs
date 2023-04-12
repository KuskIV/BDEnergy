using BDEnergyFramework.Models;
using BDEnergyFramework.Models.Internal;
using System.Timers;
using BDEnergyFramework.Utils;
using Microsoft.VisualBasic;

namespace BDEnergyFramework.MeasuringInstruments;

public class Rapl : MeasuringInstrument
{
    private List<Dictionary<string, double>> _raplData;
    private Dictionary<string, double> _firstRaplData;
    private readonly string _raplBasePath = "/sys/class/powercap/";
    private readonly float _milion = 1000000;
    private DateTime _startTime;

    public Rapl(EMeasuringInstrument measuringInstrument) : base(measuringInstrument)
    {
    }

    internal override void StartMeasuringInstruments(string path)
    {
        _raplData = new List<Dictionary<string, double>>();
        _firstRaplData = new Dictionary<string, double>();
        _startTime = DateTime.UtcNow;
    }

    internal override void StopMeasuringInstrument()
    {
        // Do nothing
    }

    internal override (TimeSeries, Measurement) ParseData(string path, DateTime startTime, DateTime endTime, long elapsedMilliseconds, double startTemperature, double endTemperature, int iteration)
    {
        var ts = new TimeSeries()
        {
            Sampels = _raplData.Select(x => Mapper.MapToTimeSeries(x)).ToList()
        };
        
        var lastSample = ts.Sampels.Last().AdditionalMetadata;

        var totalDram = GetValueOrDefaultFromDictionary(lastSample, "total_dram");
        var totalPackage = GetValueOrDefaultFromDictionary(lastSample, "total_package");
        var totalUncore = GetValueOrDefaultFromDictionary(lastSample, "total_uncore");

        var m = new Measurement()
        {
            StartTime = startTime,
            EndTime = endTime,
            StartTemperature = startTemperature,
            EndTemperature = endTemperature,
            Duration = elapsedMilliseconds,
            Iteration = iteration,
            DramEnergyInJoules = totalDram,
            CpuEnergyInJoules = totalPackage,
            GpuEnergyInJoules = totalUncore,
        };

        return (ts, m);
    }

    private static double GetValueOrDefaultFromDictionary(Dictionary<string, double> lastSample, string key)
    {
        var value = 0d;
        if (lastSample.TryGetValue(key, out var v))
        {
            value = v;
        }

        return value;
    }

    internal override void PerformMeasuring(object sender, ElapsedEventArgs e)
    {
        var dirs = Directory.GetDirectories(_raplBasePath);

        var data = ReadRaplData(dirs);

        if (!_raplData.Any())
        {
            _firstRaplData = data;
        }

        var runningData = GenerateRunningData(data);
        runningData.Add("elapsed", (DateTime.UtcNow - _startTime).TotalMilliseconds);

        _raplData.Add(runningData);
    }

    private Dictionary<string, double> GenerateRunningData(Dictionary<string, double> data)
    {
        var runningData = new Dictionary<string, double>();

        foreach (var key in data.Keys)
        {
            if (_firstRaplData.TryGetValue(key, out var firstValue))
            {
                runningData.Add($"running_{key}", data[key] - firstValue);
            }

            if (!_raplData.Any())
            {
                runningData.Add(key, 0);
            }
            else
            {
                var last = _raplData.Last();

                if (last.TryGetValue(key, out var lastValue))
                {
                    runningData.Add(key, data[key] - firstValue - lastValue);
                }
            }
        }

        return runningData;
    }

    private Dictionary<string, double> ReadRaplData(string[] dirs)
    {
        var data = new Dictionary<string, double>();

        foreach (var d in dirs)
        {
            var files = Directory.GetFiles(d);

            if (files.FirstOrDefault(x => x.EndsWith("/name")) is { } namePath
                && files.FirstOrDefault(x => x.EndsWith("/energy_uj")) is { } energyPath)
            {
                var name = LinuxUtils.ExecuteCommandGetOutputAsSudo("cat", namePath);
                var value = LinuxUtils.ExecuteCommandGetLongOutputAsSudo("cat", energyPath);

                var adjustedValue = value / _milion;

                data.Add(name, (double)adjustedValue);
            }
        }

        return data;
    }
}