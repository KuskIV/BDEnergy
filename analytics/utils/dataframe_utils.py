import json


def get_rapl_column(df, column):
    last_rapl_value = 0
    rapl_values = []

    for _, rapl_row in df.iterrows():
        loaded_value = json.loads(rapl_row["AdditionalMetadata"])[column]
        rapl_value = loaded_value - last_rapl_value
        last_rapl_value = loaded_value
        rapl_values.append(rapl_value)

    return rapl_values


def trim_dataframes(
    measurements_used,
    dram_energy_results,
    cpu_energy_results,
    gpu_energy_results,
    duration_results,
    cpu_dynamic_energy_consumption,
    gpu_dynamic_energy_consumption,
    dram_dynamic_energy_consumption,
    idle_cpu_consumption_results,
    temperature_end,
    temperature_begin,
    cpu_dynamic_energy_watt_consumption,
):
    for key, value in dram_energy_results.items():
        dram_energy_results[key] = value[:measurements_used]

    for key, value in cpu_energy_results.items():
        cpu_energy_results[key] = value[:measurements_used]

    for key, value in gpu_energy_results.items():
        gpu_energy_results[key] = value[:measurements_used]

    for key, value in duration_results.items():
        duration_results[key] = value[:measurements_used]

    for key, value in cpu_dynamic_energy_consumption.items():
        cpu_dynamic_energy_consumption[key] = value[:measurements_used]

    for key, value in gpu_dynamic_energy_consumption.items():
        gpu_dynamic_energy_consumption[key] = value[:measurements_used]

    for key, value in dram_dynamic_energy_consumption.items():
        dram_dynamic_energy_consumption[key] = value[:measurements_used]

    for key, value in idle_cpu_consumption_results.items():
        idle_cpu_consumption_results[key] = value[:measurements_used]

    for key, value in temperature_end.items():
        temperature_end[key] = value[:measurements_used]

    for key, value in temperature_begin.items():
        temperature_begin[key] = value[:measurements_used]

    for key, value in cpu_dynamic_energy_watt_consumption.items():
        cpu_dynamic_energy_watt_consumption[key] = value[:measurements_used]


def get_additional_metadata_total(tc_measurements, tc_name):
    process_energy_consumption = []

    for process_value in list(tc_measurements["AdditionalMetadata"]):
        field = json.loads(process_value)
        keys = field.keys()
        relevant_keys = [x for x in keys if tc_name in x]

        if len(relevant_keys) == 0:
            consumption = 0
            process_energy_consumption.append(consumption)
            continue

        if len(relevant_keys) > 1:
            raise Exception(f"too many keys: {','.join(relevant_keys)}")

        relevant_key = relevant_keys[0]

        if relevant_key in field:
            consumption = field[relevant_key]
        else:
            consumption = 0

        process_energy_consumption.append(consumption)
    return process_energy_consumption


def get_additional_metadata_dynamic_energy_consumption(
    tc_measurements, energy_per_time, tc_name
):
    return _get_dynamic_energy(
        tc_measurements, "AdditionalMetadata", energy_per_time, 0, tc_name
    )


def get_cpu_energy_per_time(df, energy_per_time, tc_name):
    return _get_column_energy_per_time(
        df, energy_per_time, "CpuEnergyInJoules", tc_name
    )


def get_gpu_energy_per_time(df, energy_per_time, tc_name):
    return _get_column_energy_per_time(
        df, energy_per_time, "GpuEnergyInJoules", tc_name
    )


def get_dram_energy_per_time(df, energy_per_time, tc_name):
    return _get_column_energy_per_time(
        df, energy_per_time, "DramEnergyInJoules", tc_name
    )


def get_cpu_dynamic_energy(df, idle_consumption, energy_per_time, tc_name):
    return _get_dynamic_energy(
        df, "CpuEnergyInJoules", energy_per_time, idle_consumption, tc_name
    )


def get_gpu_dynamic_energy(df, idle_consumption, energy_per_time, tc_name):
    return _get_dynamic_energy(
        df, "GpuEnergyInJoules", energy_per_time, idle_consumption, tc_name
    )


def get_dram_dynamic_energy(df, idle_consumption, energy_per_time, tc_name):
    return _get_dynamic_energy(
        df, "DramEnergyInJoules", energy_per_time, idle_consumption, tc_name
    )


def _get_dynamic_energy(df, column_name, energy_per_time, idle_consumption, tc_name):
    dynamic_energy = []

    for entires in zip(list(df[column_name]), list(df["Duration"])):
        energy = entires[0]
        duration = entires[1]

        if column_name == "AdditionalMetadata":
            tc_metadata = json.loads(energy)
            energy = tc_metadata[[x for x in tc_metadata.keys() if tc_name in x][0]]

        sub_energy = _get_energy_per_time(energy, duration, energy_per_time)
        dynamic_energy_consumed = sub_energy - idle_consumption

        dynamic_energy.append(dynamic_energy_consumed)

    return dynamic_energy


def _get_energy_per_time(energy, duration, energy_per_time):
    duration_in_seconds = duration / 1000
    power_in_watts = energy / duration_in_seconds

    return power_in_watts * (energy_per_time / 1000)


def _get_column_energy_per_time(df, energy_per_time, column_name, tc_name):
    avg_duration = df["Duration"].mean()

    if column_name == "AdditionalMetadata":
        tc_metadata = json.loads(df["AdditionalMetadata"])
        energy = tc_metadata[[x for x in tc_metadata.keys() if tc_name in x]]
        avg_energy = sum(energy) / len(energy)
    else:
        avg_energy = df[column_name].mean()

    return _get_energy_per_time(avg_energy, avg_duration, energy_per_time)
