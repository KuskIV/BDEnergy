@echo off
setlocal

set micro_cpp_folder=microbenchmarks\cpp

set cpp_single_folder=%micro_cpp_folder%\single-thread
set cpp_multi_folder=%micro_cpp_folder%\multi-thread
set msvc_folder=msvc

if not exist %cpp_single_folder%\%msvc_folder% mkdir %cpp_single_folder%\%msvc_folder%
if not exist %cpp_multi_folder%\%msvc_folder% mkdir %cpp_multi_folder%\%msvc_folder%


set paths=%cpp_single_folder% %cpp_multi_folder%

for %%p in (%paths%) do (
    del /Q /S %%p\%msvc_folder%\*.*
    for %%f in (%%p\*.cpp) do (
        cl /EHsc /openmp:llvm  %%f /Fo%%p\%msvc_folder%\%%~nf.obj /Fe%%p\%msvc_folder%\%%~nf.exe
    )
)

endlocal
