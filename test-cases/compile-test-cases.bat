set micro_cpp_folder=microbenchmarks\cpp

set cpp_single_folder=%micro_cpp_folder%\single-thread
set cpp_multi_folder=%micro_cpp_folder%\multi-thread
set msvc_folder=msvc

if not exist %cpp_single_folder%\%msvc_folder% mkdir %cpp_single_folder%\%msvc_folder%
if not exist %cpp_multi_folder%\%msvc_folder% mkdir %cpp_multi_folder%\%msvc_folder%

for %%t in (fasta nbody spectral-norm) do (
    cl /EHsc  %cpp_single_folder%/%%t.cpp /Fo%cpp_single_folder%/%msvc_folder%\%%t.obj /Fe%cpp_single_folder%/%msvc_folder%\%%t.exe 2>nul || (
        echo an error occurred when compiling %%t
    )
)

for %%t in (mandelbrot reverse-complement) do (
    cl /EHsc  %cpp_multi_folder%/%%t.cpp /Fo%cpp_multi_folder%/%msvc_folder%\%%t.obj /Fe%cpp_multi_folder%/%msvc_folder%\%%t.exe 2>nul || (
        echo an error occurred when compiling %%t
    )
)

