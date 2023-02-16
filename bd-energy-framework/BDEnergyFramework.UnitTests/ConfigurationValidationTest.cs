using BDEnergyFramework.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDEnergyFramework.UnitTests
{
    public class ConfigurationValidationTest
    {
        [Fact]
        public void When_ConfigurationIsInvalid_GiveError()
        {

        }

        [Fact]
        public void When_ConfigurationIsValid_Approve()
        {
            // arrange
            var config = GetConfiguration();

            // act

            // assert


        }

        private MeasurementConfiguration GetConfiguration(
            List<string> measurementInstruments, 
            int requiredMeasurements, 
            int measurementsBetweenRestarts, 
            List<string> testCasePaths, 
            int allocatedCores, 
            List<string> testCaseParameters)
        {
            var metadata = new Dictionary<string, string>();

            return new MeasurementConfiguration(
                MeasurementInstruments:measurementInstruments,
                RequiredMeasurements:requiredMeasurements,
                MeasurementsBetweenRestarts:measurementsBetweenRestarts,
                TestCasePaths:testCasePaths,
                AllocatedCores: allocatedCores,
                TestCaseParameters:testCaseParameters,
                AdditionalMetadata: metadata);
        }
    }
}
