# Exploring the Energy Consumption of Highly Parallel Software on Windows

This repository is a study of highly parallel software on software, which explores how the dynamic energy consumption and execution time is effect when executing macrobenchmarks on an increasing number of cores.

This work is made as a Masters Project in Computer Science at AAU by Mads Hjuler Kusk, Jamie Baldwin Pedersen and Jeppe Jon Holt, in cooperation with Lone Leth Thomsen and Bent Thomsen, and contains the code, article and documentation. The project was written in the spring of 2023.

### Abstract:

> With the evolution of CPUs in recent years, increasing the number of cores has become the norm resulting in additional resources for software to utilize. Through four research questions, we investigate the energy consumption and performance gains obtained from the additional processing power and the impact of P- and E-cores on parallel software. The experiments are conducted on two computers, where the analysis is made based on energy consumption and execution time on a per-core basis and on an increasing number of cores. The experiments are primarily conducted on Windows, where Intel's Running Average Power Limit is unavailable. The energy consumption on Windows is measured on the best performing measuring instrument, found through a set of experiments. Through the experiments, it is found, that more measurements are required to gain confidence in the results than is generally seen in the literature. Furthermore, potential issues when presenting multiple measurements taken over a period of time as a single value were discovered, and that no correlation between energy consumption and execution time when executing benchmarks on more cores could be found.

### Citation

If you use this project for your research, please cite the following paper:

```
@inproceedings{bde2023,
title = {{Exploring the Energy Consumption of Highly Parallel Software on Windows}},
author = {Mads H. Kusk, Jeppe J. Holt and Jamie B. Pedersen},
year = 2023,
location = {Aalborg, DK},
month = jun,
editor = {Lone Leth Thomsen and Bent Thomsen},
}
```
