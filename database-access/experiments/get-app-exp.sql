select 
    m.Id as CollectionId,
    -- m.Name, 
    m.ConfigurationId as Config, 
    SampleRate,
    d.Name as DutName, 
    d.Os as DutOs,
    -- t.Compiler as TestCaseCompiler,
    t.Name as TestCaseName,
    s.avgSamples as Samples,
    -- s.minSamples as miSamples,
    -- s.maxSamples as maSamples,
    lm.MaxIteration as Iteration,
    mi.Name as Mi,
    DATE_FORMAT(lm.MaxBegin, "%H:%i:%s %d-%m-%Y") as LastStart,
    round(lm.AvgCpu, 2) as AvgCpu,
    round(lm.AvgDuration, 2) as AvgDuration,
    round(lm.MinCpu, 2) as MinCpu,
    round(lm.MaxCpu, 2) as MaxCpu,
    round(lm.TempMin, 2) as MinTemp,
    round(lm.TempMax, 2) as MaxTemp,
    round(lm.TempAvg, 2) as AvgTemp,
    -- d.id as dut_id,
    t.id as tc_id,
    mi.id as mi_id
    -- ConfigurationId as c_id
from MeasuringCollection as m 
    inner join DeviceUnderTest as d on m.DutId = d.id
    inner join TestCase as t on m.TestCaseId = t.Id
    inner join MeasuringInstrument as mi on mi.id = m.MeasuringInstrumentId
    inner join (
        select 
            Max(Iteration) as MaxIteration, 
            CollectionId, 
            Max(BeginTime) as MaxBegin, 
            avg(Duration) as AvgDuration, 
            avg(CpuEnergyInJoules) as AvgCpu,
            min(CpuEnergyInJoules) as MinCpu,
            max(CpuEnergyInJoules) as MaxCpu,
            min(PackageTemperatureEnd) as TempMin,
            max(PackageTemperatureEnd) as TempMax,
            avg(PackageTemperatureEnd) as TempAvg
        from 
            Measurement 
        group by 
            CollectionId
        ) as lm on lm.CollectionId = m.Id
    inner join(
            select 
                avg(t.samples) as avgSamples,
                min(t.samples) as minSamples, 
                max(t.samples) as maxSamples, 
                CollectionId from (
                    select count(*) as samples, CollectionId, MeasurementId from Sample
                    where 1 = 1
                    group by MeasurementId, CollectionId
            ) as t
            group by t.CollectionId
    ) as s on s.CollectionId = m.Id
where 1 = 1
    and d.Env = 'prod'
    and m.Name = 'same-one-api-compiler-different-measuring-instruments-post-update-and-watt'
    and t.Parameter in ('', '64000', '12')
    -- and d.Os = 'win32nt'
    and t.Compiler = 'intel-one-api'
    and m.CollectionNumber = 2
    and d.Name = 'workstationtwo'
    -- and d.Name = 'workstationone'
    -- and t.Name = 'mandelbrot.exe'
    and not mi.Name in ('broken_clamp', 'yet_another_wonky_clamp', 'wonky_clamp', 'shit_clamp', 'donkey_clamp', 'sliding_clamp', 'clamp_with_multiple_points', 'maybe_good_clamp')
order by
    lm.MaxBegin desc