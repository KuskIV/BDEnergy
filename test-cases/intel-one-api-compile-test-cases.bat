@echo off
setlocal

set micro_cpp_folder=microbenchmarks\cpp

set cpp_single_folder=%micro_cpp_folder%\single-thread
set cpp_multi_folder=%micro_cpp_folder%\multi-thread
set intel_folder=intel-one-api

if not exist %cpp_single_folder%\%intel_folder% mkdir %cpp_single_folder%\%intel_folder%
if not exist %cpp_multi_folder%\%intel_folder% mkdir %cpp_multi_folder%\%intel_folder%


set paths=%cpp_multi_folder%

for %%p in (%paths%) do (
    del /Q /S %%p\%intel_folder%\*.*
    for %%f in (%%p\*.cpp) do (
        icx -openmp -o %%p\%intel_folder%\%%~nf %%f
    )
)

set paths=%cpp_single_folder%

for %%p in (%paths%) do (
    del /Q /S %%p\%intel_folder%\*.*
    for %%f in (%%p\*.cpp) do (
        icx -o %%p\%intel_folder%\%%~nf %%f
    )
)

endlocal
