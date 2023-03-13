using RaspberryEnergyProcessing.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RaspberryEnergyProcessing.Handlers
{
    public class TimeSliceHandler
    {
        List<Measurement> measurements;

        public TimeSliceHandler(List<Measurements> ms)
        {
            measurements = UnpackMeasurements(ms);
        }

        private List<Measurement> UnpackMeasurements(List<Measurements> measurements) 
        {
            List <Measurement> res = new List <Measurement>();
            foreach (var m in measurements)
            {
                res.AddRange(m.measurements);
            }
            return res;
        }

        public List<Measurement> SelectRelevantPeriod(DateTime start, DateTime end) 
        {
            int startIndex = GetIndexOfStart(start);
            int endIndex = GetIndexOfEnd(end);
            return measurements.ToArray()[startIndex..endIndex].ToList();
        }

        private int GetIndexOfStart(DateTime start)
        {
            int index = -1;
            for (int i = 0; i < measurements.Count; i++)
            {
                if (measurements[i].time >= start) 
                {
                    index = i;
                    break;
                }
            }
            return index;
        }

        private int GetIndexOfEnd(DateTime end)
        {
            int index = -1;
            for (int i = measurements.Count-1; i >= 0; i--)
            {
                if (measurements[i].time <= end)
                {
                    index = i;
                    break;
                }
            }
            return index;
        }
    }
}
