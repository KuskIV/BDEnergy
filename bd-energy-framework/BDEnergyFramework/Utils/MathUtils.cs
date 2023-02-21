using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.Utils
{
    internal static class MathUtils
    {
        private static readonly int _digits = 3;

        public static string GetMinMaxAvgStdAsString(List<double> values)
        {
            var min = values.Min();
            var max = values.Max();
            var avg = values.Average();
            var std = GetStd(values);

            return $"min: {Math.Round(min, _digits)}, max: {Math.Round(max, _digits)}, avg: {Math.Round(avg, _digits)}, std: {Math.Round(std, _digits)}";
        }

        public static string GetMinMaxAvgStdAsString(List<long> values)
        {
            return GetMinMaxAvgStdAsString(values.Select(x => (double)x).ToList());
        }

        private static double GetStd(List<double> values)
        {
            // From https://stackoverflow.com/questions/3141692/standard-deviation-of-generic-list
            // by Jonathan DeMarks   
            var avg = values.Average();
            return Math.Sqrt(values.Average(v => Math.Pow(v - avg, 2)));
        }

        private static double GetStd(List<long> values)
        {
            // From https://stackoverflow.com/questions/3141692/standard-deviation-of-generic-list
            // by Jonathan DeMarks   
            var avg = values.Average();
            return Math.Sqrt(values.Average(v => Math.Pow(v - avg, 2)));
        }
    }
}
