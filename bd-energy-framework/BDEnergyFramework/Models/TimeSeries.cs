using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.Models
{
    public class TimeSeries
    {
        public TimeSeries()
        {
            Sampels = new List<Sample>();
        }

        public List<Sample> Sampels { get; set; }

    }
}
