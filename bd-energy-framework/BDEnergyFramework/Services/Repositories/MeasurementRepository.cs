using BDEnergyFramework.Models;
using BDEnergyFramework.Models.Dto;
using BDEnergyFramework.Models.Internal;
using System;
using System.Collections.Generic;
using System.Data;
using Dapper;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Polly;
using Polly.Retry;
using System.Text.Json;
using static Org.BouncyCastle.Math.EC.ECCurve;
using Org.BouncyCastle.Math.EC;
using Microsoft.AspNetCore.Components.Web;
using BDEnergyFramework.Utils;

namespace BDEnergyFramework.Services.Repositories
{
    public class MeasurementRepository : IMeasurementRepository, IDisposable
    {
        private readonly IDbConnection _connection;
        private readonly RetryPolicy _retryPolicy;

        public MeasurementRepository(IDbConnection connection)
        {
            _connection = connection;
            _retryPolicy = Policy
                .Handle<Exception>()
                .WaitAndRetry(3, retryAttempt => TimeSpan.FromSeconds(Math.Pow(2, retryAttempt)));
        }

        public void Dispose()
        {
            _connection.Dispose();
        }

        public bool ConfigExists(Configuration configuration)
        {
            var allocatedCores = JsonSerializer.Serialize(configuration.AllocatedCores).Replace("[", "").Replace("]", "");

            var query = "SELECT COUNT(*) FROM Configuration WHERE " +
                "MinimumTemperature = @minTemp AND " +
                "MaximumTemperature = @maxTemp AND " +
                "Burnin = @burnin AND " +
                $"JSON_CONTAINS(AllocatedCores, JSON_ARRAY({allocatedCores}))";
                //"JSON_CONTAINS(AllocatedCores, JSON_ARRAY(@allocatedCores))";

            var response = _retryPolicy.Execute(() => _connection.ExecuteScalar<int>(query, new
            {
                minTemp = configuration.MinimumTemperature,
                maxTemp = configuration.MaximumTemperature,
                burnin = configuration.Burnin,
                allocatedCores = string.Join(',', configuration.AllocatedCores)
            }));

            return response > 0;
        }

        public bool DutExists(DeviceUnderTest dut)
        {
            var query = "SELECT COUNT(*) FROM DeviceUnderTest WHERE " +
                "Name = @name AND " +
                "Os = @os AND " +
                "Env = @env";

            var response = _retryPolicy.Execute(() => _connection.ExecuteScalar<int>(query, new
            {
                name=dut.Name.ToLower(),
                os=dut.Os.ToLower(),
                env=dut.Env.ToLower(),
            }));

            return response > 0;
        }

        public DtoConfiguration GetConfiguration(Configuration configuration)
        {
            var allocatedCores = JsonSerializer.Serialize(configuration.AllocatedCores).Replace("[", "").Replace("]", "");
            
            var query = "select * from Configuration WHERE " +
                "MinimumTemperature = @minTemp AND " +
                "MaximumTemperature = @maxTemp AND " +
                "Burnin = @burnin AND " +
                //$"JSON_CONTAINS(AllocatedCores, JSON_ARRAY(@allocatedCores))";
                $"JSON_CONTAINS(AllocatedCores, JSON_ARRAY({allocatedCores}))";

            return _retryPolicy.Execute(() => _connection.QueryFirst<DtoConfiguration>(query, new
            {
                minTemp = configuration.MinimumTemperature,
                maxTemp = configuration.MaximumTemperature,
                burnin=configuration.Burnin,
                //allocatedCores=JsonSerializer.Serialize(configuration.AllocatedCores)
            }));
        }

        public DtoDeviceUnderTest GetDut(DeviceUnderTest dut)
        {
            var query = "SELECT * FROM DeviceUnderTest WHERE " +
                "Name = @name AND " +
                "Os = @os AND " +
                "Env = @env";

            return _retryPolicy.Execute(() => _connection.QueryFirst<DtoDeviceUnderTest>(query, new
            {
                name=dut.Name.ToLower(),
                os = dut.Os.ToLower(),
                env=dut.Env.ToLower(),
            }));
        }

        public DtoMeasurementCollection GetMeasurementCollection(MeasurementCollection mc)
        {
            var additionalMetadata = JsonSerializer.Serialize(mc.AdditionalMetadata);

            var query = "SELECT * FROM MeasuringCollection WHERE " +
                "Name=@name AND " +
                "ConfigurationId = @configId AND " +
                "TestCaseId = @testCaseId AND " +
                "DutId = @dutId AND " +
                "MeasuringInstrumentId = @measuringInstrumentId AND " +
                $"JSON_CONTAINS(AdditionalMetadata, '{additionalMetadata}') AND " +
                //"JSON_CONTAINS(AdditionalMetadata, @additionalMetadata) AND " +
                "CollectionNumber = @collectionNumber";

            return _retryPolicy.Execute(() => _connection.QueryFirst<DtoMeasurementCollection>(query, new
            {
                name=mc.CollectionName.ToLower(),
                configId=mc.ConfigurationId,
                testCaseId=mc.TestCaseId,
                dutId=mc.DutId,
                measuringInstrumentId=mc.MeasurementInstrumentId,
                collectionNumber=mc.CollectionNumber,
                //additionalMetadata=JsonSerializer.Serialize(mc.AdditionalMetadata)
            }));
        }

        public DtoMeasurementInstrument GetMeasuringInstrument(MeasurementInstrument measuringInstrument)
        {
            var query = "SELECT * FROM MeasuringInstrument WHERE " +
                "Name = @name AND " +
                "SampleRate = @sampleRate";

            return _retryPolicy.Execute(() => _connection.QueryFirst<DtoMeasurementInstrument>(query, new
            {
                name=measuringInstrument.Name.ToLower(),
                sampleRate=measuringInstrument.SamplesRate
            }));
        }

        public DtoTestCase GetTestCase(TestCase tc)
        {
            var query = "SELECT * FROM TestCase WHERE " +
                "Name=@name AND " +
                "Compiler = @compiler AND " +
                "Language = @language AND " +
                "Optimizations = @optimizations AND " +
                "TestCaseSize = @testcasesize AND " +
                "Parameter = @parameter AND " +
                "Threads = @threads";

            return _retryPolicy.Execute(() => _connection.QueryFirst<DtoTestCase>(query, new
            {
                name=tc.Name.ToLower(),
                compiler=tc.Compiler.ToLower(),
                language=tc.Language.ToLower(),
                optimizations=tc.Optimizations.ToLower(),
                testcasesize=tc.TestCaseSize,
                parameter=tc.Parameter.ToLower(),
                threads=tc.ConcurrencyLimit.ToLower()
            }));
        }

        public void InsertConfiguration(Configuration c)
        {
            var query = "INSERT INTO Configuration(MinimumTemperature, MaximumTemperature, Burnin, AllocatedCores) " +
                "VALUES(@minTemp, @maxTemp, @burnin, @allocatedCores)";

            _retryPolicy.Execute(() => _connection.Execute(query, new
            {
                minTemp=c.MinimumTemperature,
                maxTemp=c.MaximumTemperature,
                burnin=c.Burnin,
                allocatedCores=JsonSerializer.Serialize(c.AllocatedCores)
            }));
        }

        public void InsertDut(DeviceUnderTest dut)
        {
            var query = "INSERT INTO DeviceUnderTest(Name, Os, Env) " +
                "VALUES(@name, @os, @env)";

            _retryPolicy.Execute(() => _connection.Execute(query, new
            {
                name=dut.Name.ToLower(),
                os=dut.Os.ToLower(),
                env=dut.Env.ToLower(),
            }));
        }

        public void InsertMeasurement(Measurement m, int collectionId)
        {
            var query = "INSERT INTO Measurement(Iteration, CollectionId, PackageTemperatureBegin, PackageTemperatureEnd, Duration, DramEnergyInJoules, GpuEnergyInJoules, CpuEnergyInJoules, BeginTime, EndTime, AdditionalMetadata) " +
                "VALUES(@iteration, @collectionId, @tempBegin, @tempEnd, @duration, @dramEnergy, @gpuEnergy, @cpuEnergy, @beginTime, @endTime, @additionalMetadata)";

            _retryPolicy.Execute(() => _connection.Execute(query, new
            {
                iteration=m.Iteration,
                collectionId=collectionId,
                tempBegin=m.StartTemperature,
                tempEnd=m.EndTemperature,
                duration=m.Duration,
                dramEnergy=m.DramEnergyInJoules,
                gpuEnergy=m.GpuEnergyInJoules,
                cpuEnergy=m.CpuEnergyInJoules,
                beginTime=m.StartTime,
                endTime=m.EndTime,
                additionalMetadata=JsonSerializer.Serialize(m.AdditionalMetadata)
            }));
        }

        public void InsertMeasurementCollection(MeasurementCollection mc)
        {
            var query = "INSERT INTO MeasuringCollection(Name, ConfigurationId, TestCaseId, DutId, MeasuringInstrumentId, AdditionalMetadata, CollectionNumber) " +
                "VALUES(@name, @configId, @testCaseId, @dutId, @measurementInstrumentId, @additionalMetadata, @collectionNumber)";

            _retryPolicy.Execute(() => _connection.Execute(query, new
            {
                name=mc.CollectionName.ToLower(),
                configId=mc.ConfigurationId,
                testCaseId=mc.TestCaseId,
                dutId=mc.DutId,
                measurementInstrumentId=mc.MeasurementInstrumentId,
                additionalMetadata=JsonSerializer.Serialize(mc.AdditionalMetadata),
                collectionNumber=mc.CollectionNumber
            }));
        }

        public void InsertMeasuringInstrument(MeasurementInstrument mi)
        {
            var query = "INSERT INTO MeasuringInstrument(Name, SampleRate) " +
                "VALUES(@name, @sampleRate)";

            _retryPolicy.Execute(() => _connection.Execute(query, new
            {
                name = mi.Name.ToString().ToLower(),
                sampleRate = mi.SamplesRate
            }));
        }

        public void InsertTestCase(TestCase tc)
        {
            var query = "INSERT INTO TestCase(Name, Compiler, Language, Optimizations, TestCaseSize, Parameter, Threads) " +
                "VALUES(@name, @compiler, @language, @optimizations, @testCaseSize, @parameter, @thread)";

            _retryPolicy.Execute(() =>  _connection.Execute(query, new
            {
                name=tc.Name.ToLower(),
                compiler=tc.Compiler.ToLower(),
                language=tc.Language.ToLower(),
                optimizations=tc.Optimizations.ToLower(),
                testCaseSize=tc.TestCaseSize.ToLower(),
                parameter=tc.Parameter.ToLower(),
                thread=tc.ConcurrencyLimit.ToLower()
            }));
        }

        public void InsertTimeseries(Sample t, int collectionId)
        {
            var query = "INSERT INTO Sample(CollectionId, PackageTemperature, ElapsedTime, ProcessorPowerInWatt, DramEnergyInJoules, GpuEnergyInJoules, CpuEnergyInJoules, CpuUtilization, AdditionalMetadata) " +
                "VALUES(@collectionid, @packageTemperature, @elapsedTime, @processorPowerInWatt, @dramEnergyInJoules, @gpuEnergyInJoules, @cpuEnergyInJoules, @cpuUtilization, @additionalMetadata)";

            var keys = t.AdditionalMetadata.Where(x => x.Value.ToString() == "NaN").Select(y => y.Key);

            foreach (var key in keys)
            {
                t.AdditionalMetadata.Remove(key);
                t.AdditionalMetadata.Add(key, -1);
            }

            _retryPolicy.Execute(() => _connection.Execute(query, new 
            {
                collectionid=collectionId,
                packageTemperature=t.PackageTemperature,
                elapsedTime=t.ElapsedTime,
                processorPowerInWatt=t.ProcessorPowerWatt,
                dramEnergyInJoules=t.DramEnergyInJoules,
                gpuEnergyInJoules=t.GpuEnergyInJoules,
                cpuEnergyInJoules=t.CpuEnergyInJoules,
                cpuUtilization=t.CpuUtilization,
                additionalMetadata=JsonSerializer.Serialize(t.AdditionalMetadata),
            }));
        }

        public bool MeasurementCollectionExists(MeasurementCollection mc)
        {
            var additionalMetadata = JsonSerializer.Serialize(mc.AdditionalMetadata);

            var query = "SELECT COUNT(*) FROM MeasuringCollection WHERE " +
                "Name=@name AND " +
                "ConfigurationId=@configId AND " +
                "TestCaseId=@testCaseId AND " +
                "DutId=@dutId AND " +
                "MeasuringInstrumentId=@measuringInstrumentId AND " +
                $"JSON_CONTAINS(AdditionalMetadata, '{additionalMetadata}') AND " +
                //"JSON_CONTAINS(AdditionalMetadata, '@additionalMetadata') AND " +
                "CollectionNumber=@collectionNumber";

            var response = _retryPolicy.Execute(() => _connection.ExecuteScalar<int>(query,
                new
                {
                    name=mc.CollectionName.ToLower(),
                    collectionNumber = mc.CollectionNumber,
                    //additionalMetadata = JsonSerializer.Serialize(mc.AdditionalMetadata),
                    dutId = mc.DutId,
                    testCaseId=mc.TestCaseId,
                    measuringInstrumentId=mc.MeasurementInstrumentId,
                    configId=mc.ConfigurationId,
                }));

            return response > 0;
        }

        public bool MeasuringInstrumentExists(MeasurementInstrument mi)
        {
            var query = "SELECT COUNT(*) FROM MeasuringInstrument WHERE " +
                "Name=@name AND " +
                "SampleRate = @sampleRate";

            var response = _retryPolicy.Execute(() => _connection.ExecuteScalar<int>(query,
                new
                {
                    name=mi.Name.ToString().ToLower(),
                    sampleRate = mi.SamplesRate,
                }));

            return response > 0;
        }

        public bool TestCaseExists(TestCase testCase)
        {
            var query = "SELECT COUNT(*) FROM TestCase WHERE " +
                "Name = @name AND " +
                "Compiler = @compiler AND " +
                "Parameter = @parameter AND " +
                "Language = @language AND " +
                "TestCaseSize = @testCaseSize AND " +
                "Optimizations = @optimizations AND " +
                "@Threads = threads";

            var response = _retryPolicy.Execute(() => _connection.ExecuteScalar<int>(query, 
                new 
                { 
                    name = testCase.Name.ToLower(),
                    compiler = testCase.Compiler.ToLower(), 
                    parameter = testCase.Parameter.ToLower(), 
                    language = testCase.Language.ToLower(), 
                    testCaseSize = testCase.TestCaseSize.ToLower(),
                    optimizations = testCase.Optimizations.ToLower(),
                    threads = testCase.ConcurrencyLimit.ToLower()
                }));

            return response > 0;
        }

        internal IEnumerable<Measurement> GetMeasurements(int measurementCollection)
        {
            var query = "SELECT * FROM Measurement WHERE CollectionId = @id";

            var response = _retryPolicy.Execute(() => _connection.Query<DtoMeasurement>(query, new
            {
                id = measurementCollection
            }));

            return Mapper.Map(response);
        }
    }
}
