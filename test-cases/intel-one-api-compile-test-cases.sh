#!/bin/bash

micro_cpp_folder="microbenchmarks/cpp"
cpp_single_folder="$micro_cpp_folder/single-thread"
cpp_multi_folder="$micro_cpp_folder/multi-thread"
intel_folder="intel-one-api"

if [ ! -d "$cpp_single_folder/$intel_folder" ]; then
  mkdir -p "$cpp_single_folder/$intel_folder"
fi

if [ ! -d "$cpp_multi_folder/$intel_folder" ]; then
  mkdir -p "$cpp_multi_folder/$intel_folder"
fi

paths="$cpp_multi_folder"

for p in $paths; do
  rm -rf "$p/$intel_folder/*"
  for f in $p/*.cpp; do
    icx -openmp -o "$p/$intel_folder/$(basename ${f%.*})" "$f"
  done
done

paths="$cpp_single_folder"

for p in $paths; do
  rm -rf "$p/$intel_folder/*"
  for f in $p/*.cpp; do
    icx -o "$p/$intel_folder/$(basename ${f%.*})" "$f"
  done
done