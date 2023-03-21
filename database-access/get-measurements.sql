select 
    m.Id,
    Iteration,
    m.CollectionId,
    Duration,
    s.Samples as Samples,
    Round(CpuEnergyInJoules, 1) as Cpu,
    Round(GpuEnergyInJoules, 1) as Gpu,
    Round(DramEnergyInJoules, 1) as Dram,
    Round(PackageTemperatureBegin, 1) as TempBegin,
    Round(PackageTemperatureEnd, 1) as TempEnd,
    DATE_FORMAT(BeginTime, "%H:%i:%s %d-%m-%Y") as Time
from Measurement as m
    inner join(
        select count(*) as Samples, MeasurementId, CollectionId from Sample group by CollectionId, MeasurementId
    ) as s on s.MeasurementId = m.Id and s.CollectionId = m.CollectionId 
where 1 = 1
    and m.CollectionId = 20