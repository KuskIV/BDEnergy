using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.Utils
{
    public static class ProcessorAffinityGenerator
    {
        public static IntPtr GenerateProcessorAffinity(List<int> cpuList)
        {
            int affinity = 0;
            foreach (int cpu in cpuList)
            {
                affinity |= 1 << cpu;
            }
            return new IntPtr(affinity);
        }
    }
}
