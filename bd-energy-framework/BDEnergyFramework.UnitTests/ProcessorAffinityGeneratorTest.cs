using BDEnergyFramework.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.UnitTests
{
    public class ProcessorAffinityGeneratorTest
    {
        [Fact]
        public void TestAffinityGenerator()
        {
            var coreOne = new List<int>() { 1 };

            var expectedCoreOne = new IntPtr(0b0000_0000_0000_0010);
            var actualCoreOne = ProcessorAffinityGenerator.GenerateProcessorAffinity(coreOne);

            Assert.Equal(expectedCoreOne, actualCoreOne);

            var coreMultiple = new List<int>() { 0, 1, 4, 6, 7 };

            var expectedCoreMultiple = new IntPtr(0b0000_0000_1101_0011);
            var actualCoreMultiple = ProcessorAffinityGenerator.GenerateProcessorAffinity(coreMultiple);

            Assert.Equal(expectedCoreMultiple, actualCoreMultiple);
        }
    }
}
