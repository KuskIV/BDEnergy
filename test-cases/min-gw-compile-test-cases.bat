@echo off
setlocal

set micro_cpp_folder=microbenchmarks\cpp

set cpp_single_folder=%micro_cpp_folder%\single-thread
set cpp_multi_folder=%micro_cpp_folder%\multi-thread
set min_gw_folder=min-gw

if not exist %cpp_single_folder%\%min_gw_folder% mkdir %cpp_single_folder%\%min_gw_folder%
if not exist %cpp_multi_folder%\%min_gw_folder% mkdir %cpp_multi_folder%\%min_gw_folder%

set paths=%cpp_multi_folder%

for %%p in (%paths%) do (
    del /Q /S %%p\%min_gw_folder%\*.*
    for %%f in (%%p\*.cpp) do (
        g++ -fopenmp %%f -o %%p\%min_gw_folder%\%%~nf
    )
)

set paths=%cpp_single_folder%

for %%p in (%paths%) do (
    del /Q /S %%p\%min_gw_folder%\*.*
    for %%f in (%%p\*.cpp) do (
        g++ %%f -o %%p\%min_gw_folder%\%%~nf
    )
)

endlocal
