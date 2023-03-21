select 
    m.Id as CollectionId,
    -- m.Name, 
    m.ConfigurationId as Config, 
    d.Name as DutName, 
    d.Os as DutOs,
    t.Name as TestCaseName,
    t.Compiler as TestCaseCompiler,
    mi.Name as Mi,
    lm.MaxIteration as CurrentIteration,
    s.Samples as Samples,
    round(lm.AvgDuration, 2) as AvgDuration,
    round(lm.AvgCpu, 2) as AvgCpu,
    round(lm.TempMin, 2) as MinTemp,
    round(lm.TempMax, 2) as MaxTemp,
    round(lm.TempAvg, 2) as AvgTemp,
    DATE_FORMAT(lm.MaxBegin, "%H:%i:%s %d-%m-%Y") as LastStart
from MeasuringCollection as m 
    inner join DeviceUnderTest as d on m.DutId = d.id
    inner join TestCase as t on m.TestCaseId = t.Id
    inner join MeasuringInstrument as mi on mi.id = m.MeasuringInstrumentId
    inner join (
        select 
            Max(Iteration) as MaxIteration, 
            CollectionId, Max(BeginTime) as MaxBegin, 
            avg(Duration) as AvgDuration, 
            avg(CpuEnergyInJoules) as AvgCpu,
            min(PackageTemperatureEnd) as TempMin,
            max(PackageTemperatureEnd) as TempMax,
            avg(PackageTemperatureEnd) as TempAvg
        from 
            Measurement 
        group by 
            CollectionId
        ) as lm on lm.CollectionId = m.Id
    inner join(
            select avg(t.samples) as Samples, CollectionId from (
                select count(*) as samples, CollectionId, MeasurementId from Sample
                where 1 = 1
                group by MeasurementId, CollectionId
            ) as t
            group by t.CollectionId
    ) as s on s.CollectionId = m.Id
where 1 = 1
    -- and s.CollectionId = m.Id
    and d.Env = 'prod'
    and m.Name = 'same-cpp-multi-core-micro-benchmark-different-compiler'
    and t.Parameter in ('', '16000', '12')
    and d.Os = 'win32nt'
    and mi.Name = 'ipg'