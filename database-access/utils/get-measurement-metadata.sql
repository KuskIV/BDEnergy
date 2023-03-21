select 
    m.CollectionId,
    s.Samples as Samples,
    Max(Iteration) as Iterations,
    Round(Avg(Duration), 1) as Duration,
    Round(Avg(CpuEnergyInJoules), 1) as Cpu,
    Round(Avg(GpuEnergyInJoules), 1) as Gpu,
    Round(Avg(DramEnergyInJoules), 1) as Dram,
    Round(Avg(PackageTemperatureBegin), 1) as TempBegin,
    Round(Avg(PackageTemperatureEnd), 1) as TempEnd,
    DATE_FORMAT(BeginTime, "%H:%i:%s %d-%m-%Y") as Time
from Measurement as m
    inner join (
        select count(*) as Samples, CollectionId from Sample group by CollectionId
    ) as s on s.CollectionId = m.CollectionId
where 1 = 1
    -- and m.CollectionId in (1,2,3)
    and m.CollectionId = 2
group by
    m.CollectionId