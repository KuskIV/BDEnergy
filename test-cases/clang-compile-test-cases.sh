#!/bin/bash

micro_cpp_folder="microbenchmarks/cpp"
cpp_single_folder="$micro_cpp_folder/single-thread"
cpp_multi_folder="$micro_cpp_folder/multi-thread"
clang_folder="clang"

if [ ! -d "$cpp_single_folder/$clang_folder" ]; then
  mkdir -p "$cpp_single_folder/$clang_folder"
fi

if [ ! -d "$cpp_multi_folder/$clang_folder" ]; then
  mkdir -p "$cpp_multi_folder/$clang_folder"
fi

paths="$cpp_multi_folder"

for p in $paths; do
  rm -rf "$p/$clang_folder/*"
  for f in $p/*.cpp; do
    clang++ -fopenmp=libomp "$f" -o "$p/$clang_folder/$(basename ${f%.*}).out"
  done
done

paths="$cpp_single_folder"

for p in $paths; do
  rm -rf "$p/$clang_folder/*"
  for f in $p/*.cpp; do
    clang++ "$f" -o "$p/$clang_folder/$(basename ${f%.*}).out"
  done
done