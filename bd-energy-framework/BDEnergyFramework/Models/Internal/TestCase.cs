using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.Models.Internal
{
    public class TestCase
    {
        public string Name { get; set; }
        public string Compiler { get; set; }
        public string Language { get; set; }
        public string Optimizations { get; set; }
        public string TestCaseSize { get; set; }
        public string Parameter { get; set; }
        public string ConcurrencyLimit { get; set; }
    }
}
