using BDEnergyFramework.Models;
using CsvHelper;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.Parsers
{
    public static class IntelPowerGadgetParser
    {
        public static (IntelPowerGadgetData, List<IntelPowerGadgetTimeSeries>) Parse(string path)
        {

            var intelPowerGadgetTimeSeries = new List<IntelPowerGadgetTimeSeries>();
            var intelPowerGadgetData = new IntelPowerGadgetData();

            using (var reader = new StreamReader(path))
            using (var csv = new CsvReader(reader, CultureInfo.InvariantCulture))
            {
                csv.Context.RegisterClassMap<IntelPowerGadgetTimeSeriesMapper>();

                csv.Read();
                csv.ReadHeader();

                while (csv.Read())
                {
                    var row = csv.Parser.RawRecord;

                    if (row.Contains(','))
                    {
                        var record = csv.GetRecord<IntelPowerGadgetTimeSeries>();
                        intelPowerGadgetTimeSeries.Add(record!);
                    }
                    else
                    {
                        intelPowerGadgetData.AddAttributeToData(row);
                    }
                }
            }

            return (intelPowerGadgetData, intelPowerGadgetTimeSeries);
        }
        
    }
}
