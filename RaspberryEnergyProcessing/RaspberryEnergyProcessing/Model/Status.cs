using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RaspberryEnergyProcessing.Model
{
    public class Status
    {
        bool StartSignal { get; set; } = false;
        bool StopSignal { get; set; } = false;
        bool Started { get; set; } = false; 
        bool Stopped { get; set; } = false;
    }
}
