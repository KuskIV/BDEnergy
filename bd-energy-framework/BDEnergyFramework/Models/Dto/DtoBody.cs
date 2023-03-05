using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RaspberryEnergyProcessing.Model
{
    public class DtoBody
    {
        public bool StartSignal { get; set; }
        public bool EndSignal { get; set; }
        public bool Started { get; set; }
        public bool Ended { get; set; }
        public string key { get; set; }
    }
}
