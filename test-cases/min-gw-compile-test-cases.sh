#!/bin/bash

micro_cpp_folder="microbenchmarks/cpp"
cpp_single_folder="$micro_cpp_folder/single-thread"
cpp_multi_folder="$micro_cpp_folder/multi-thread"
min_gw_folder="min-gw"

if [ ! -d "$cpp_single_folder/$min_gw_folder" ]; then
    mkdir -p "$cpp_single_folder/$min_gw_folder"
fi

if [ ! -d "$cpp_multi_folder/$min_gw_folder" ]; then
    mkdir -p "$cpp_multi_folder/$min_gw_folder"
fi

paths="$cpp_multi_folder"

for p in $paths; do
    rm -f $p/$min_gw_folder/*
    for f in $p/*.cpp; do
        g++ -fopenmp $f -o $p/$min_gw_folder/$(basename "${f%.*}")
    done
done

paths="$cpp_single_folder"

for p in $paths; do
    rm -f $p/$min_gw_folder/*
    for f in $p/*.cpp; do
        g++ $f -o $p/$min_gw_folder/$(basename "${f%.*}")
    done
done