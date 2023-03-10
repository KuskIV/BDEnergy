def get_cpu_energy_per_time(df, energy_per_time):
    return _get_column_energy_per_time(df, energy_per_time, "CpuEnergyInJoules")


def get_gpu_energy_per_time(df, energy_per_time):
    return _get_column_energy_per_time(df, energy_per_time, "GpuEnergyInJoules")


def get_dram_energy_per_time(df, energy_per_time):
    return _get_column_energy_per_time(df, energy_per_time, "DramEnergyInJoules")


def get_cpu_dynamic_energy(df, idle_consumption, energy_per_time):
    return _get_dynamic_energy(
        df, "CpuEnergyInJoules", energy_per_time, idle_consumption
    )


def get_gpu_dynamic_energy(df, idle_consumption, energy_per_time):
    return _get_dynamic_energy(
        df, "GpuEnergyInJoules", energy_per_time, idle_consumption
    )


def get_dram_dynamic_energy(df, idle_consumption, energy_per_time):
    return _get_dynamic_energy(
        df, "DramEnergyInJoules", energy_per_time, idle_consumption
    )


def _get_dynamic_energy(df, column_name, energy_per_time, idle_consumption):
    dynamic_energy = []

    for entires in zip(list(df[column_name]), list(df["Duration"])):
        energy = entires[0]
        duration = entires[1]

        sub_energy = _get_energy_per_time(energy, duration, energy_per_time)
        dynamic_energy_consumed = sub_energy - idle_consumption

        dynamic_energy.append(dynamic_energy_consumed)

    return dynamic_energy


def _get_energy_per_time(energy, duration, energy_per_time):
    duration_in_seconds = duration / 1000
    power_in_watts = energy / duration_in_seconds

    return power_in_watts * (energy_per_time / 1000)


def _get_column_energy_per_time(df, energy_per_time, column_name):
    avg_duration = df["Duration"].mean()
    avg_energy = df[column_name].mean()

    return _get_energy_per_time(avg_energy, avg_duration, energy_per_time)
