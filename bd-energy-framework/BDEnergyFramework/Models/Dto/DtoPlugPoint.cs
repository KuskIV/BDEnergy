using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.Models.Dto
{
    public class DtoPlugPoint
    {
        public int Id { get; set; }
        public int Watt { get; set; }
        public float Current { get; set; }
        public int Voltage { get; set; }
        public string Ip { get; set; }
        public DateTime Time { get; set; }
    }
}
