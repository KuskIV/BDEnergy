using BDEnergyFramework.Exceptions;
using BDEnergyFramework.Models;
using BDEnergyFramework.Models.Internal;
using BDEnergyFramework.Parsers;
using BDEnergyFramework.Utils;
using Spectre.Console;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Timers;

namespace BDEnergyFramework.MeasuringInstruments
{
    internal class IntelPowerLog : MeasuringInstrument, IDisposable
    {
        private const string IntelPowerGadgetPath = @"C:\Program Files\Intel\Power Gadget 3.6\IntelPowerGadget.exe";

        public IntelPowerLog(EMeasuringInstrument measuringInstrument) : base(measuringInstrument)
        {
        }

        internal override int GetMilisecondsBetweenSampels()
        {
            return 100;
        }

        internal override (TimeSeries, Measurement) ParseData(string path, DateTime startTime, DateTime endTime, long elapsedMilliseconds, double startTemperature, double endTemperature, int iteration)
        {
            Thread.Sleep(TimeSpan.FromSeconds(2));
            string ipgPath = GetIpgPath(startTime, endTime);

            var (ipgData, igpTimeSeries) = IntelPowerGadgetParser.Parse(ipgPath);

            var measurement = Mapper.Map(ipgData, startTime, endTime, elapsedMilliseconds, startTemperature, endTemperature, iteration);
            var timeSeries = Mapper.Map(igpTimeSeries);

            return (timeSeries, measurement);
        }

        private static string GetIpgPath(DateTime startTime, DateTime endTime)
        {
            Thread.Sleep(TimeSpan.FromSeconds(1));
            var ipgPath = PathUtils.DataFolderPath;

            var relevantPaths = Directory.GetFiles(ipgPath)
                .Where(x => x.Contains("PwrData"))
                .Where(y => File.GetLastWriteTimeUtc(y) > startTime.AddSeconds(-2) && File.GetLastWriteTimeUtc(y) < endTime.AddSeconds(2))
                .ToList();

            if (relevantPaths.Count() == 1)
            {
                return relevantPaths.First();
            }

            throw new IntelPowerGadgetFileNotFoundException();
        }

        internal override void PerformMeasuring(object sender, ElapsedEventArgs e)
        {
            // Do nothing
        }

        internal override void StartMeasuringInstruments(string path)
        {
            var igpProcess = Process.Start(IntelPowerGadgetPath);
            igpProcess.PriorityClass = ProcessPriorityClass.High;

            Thread.Sleep(TimeSpan.FromSeconds(2));
            Process.Start(IntelPowerGadgetPath, "-start");
        }

        internal override void StopMeasuringInstrument()
        {
            Process.Start(IntelPowerGadgetPath, "-stop");

            Thread.Sleep(TimeSpan.FromSeconds(2));

            KillIntelPowerGadget();
        }

        private static void KillIntelPowerGadget()
        {
            var processes = Process.GetProcessesByName(
                PathUtils.GetFilenameFromPath(IntelPowerGadgetPath).Replace(".exe", ""));

            foreach (var process in processes)
            {
                process.Kill();
            }
        }

        public void Dispose()
        {
            KillIntelPowerGadget();
        }
    }
}
