select 
    mc.id as CollectionId,
    tc.Name as TcName,
    tc.id as TcId,
    c.id as ConfigId,
    d.Id as DutId,
    d.Name as DutName,
    d.os as Os,
    d.Env as Env,
    mi.Id as MiId,
    mi.Name as MiName,
    tc.Compiler as Compiler,
    tc.Parameter as Parameter
from MeasuringCollection as mc
    inner join Configuration as c on mc.ConfigurationId = c.Id
    inner join DeviceUnderTest as d on mc.DutId = d.Id
    inner join MeasuringInstrument as mi on mi.Id = mc.MeasuringInstrumentId
    inner join TestCase as tc on tc.Id = mc.TestCaseId
where 1 = 1
    and mc.Name = 'same-one-api-compiler-different-measuring-instruments'
    -- and mc.Name = 'same-one-api-compiler-different-measuring-instruments-post-update'
    -- and mc.Name = 'same-one-api-compiler-different-measuring-instruments-post-update-watt'
    -- and mc.Name = 'same-cpp-multi-core-micro-benchmark-different-compiler'
    -- and tc.Name = 'mandelbrot.exe'
    and d.Os = 'win32nt'
    -- and mi.Name = 'ipg'
    and mi.Name = 'scaphandre'
    and tc.Compiler = 'clang'