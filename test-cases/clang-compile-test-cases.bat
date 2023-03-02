@echo off
setlocal

set micro_cpp_folder=microbenchmarks\cpp

set cpp_single_folder=%micro_cpp_folder%\single-thread
set cpp_multi_folder=%micro_cpp_folder%\multi-thread
set clang_folder=clang

if not exist %cpp_single_folder%\%clang_folder% mkdir %cpp_single_folder%\%clang_folder%
if not exist %cpp_multi_folder%\%clang_folder% mkdir %cpp_multi_folder%\%clang_folder%

set paths= %cpp_multi_folder%

for %%p in (%paths%) do (
    del /Q /S %%p\%clang_folder%\*.*
    for %%f in (%%p\*.cpp) do (
        clang++ -fopenmp %%f -o %%p\%clang_folder%\%%~nf.exe
    )
)

set paths=%cpp_single_folder%

for %%p in (%paths%) do (
    del /Q /S %%p\%clang_folder%\*.*
    for %%f in (%%p\*.cpp) do (
        clang++ %%f -o %%p\%clang_folder%\%%~nf.exe
    )
)

endlocal
