from utils.column_name_utils import *
import utils.results_repository as rep
import utils.dataframe_utils as df_util
import utils.query_utils as query


def get_measurements(
    windows,
    windows_mi,
    linux,
    linux_mi,
    used_configs,
    used_dut,
    used_mi,
    used_tc,
    used_idle_case,
    db,
    experiment_name,
    experiment_number,
    # energy_per_time,
    scaphandre,
    cpu_energy_results,
    dram_energy_results,
    gpu_energy_results,
    duration_results,
    temperature_begin,
    temperature_end,
    cpu_dynamic_energy_consumption,
    gpu_dynamic_energy_consumption,
    dram_dynamic_energy_consumption,
    idle_cpu_consumption_results,
    used_test_case_name,
    cpu_dynamic_energy_watt_consumption,
):
    for dut_index, dut_row in used_dut.iterrows():
        dut_id = dut_row[ID]
        dut_name = dut_row[NAME]
        dut_os = dut_row[OS]
        for mi_index, mi_row in used_mi.iterrows():
            mi_id = mi_row[ID]
            mi_name = mi_row[NAME]

            if dut_os == windows and not mi_name in windows_mi:
                continue

            if dut_os == linux and not mi_name in linux_mi:
                continue

            for config_index, config_row in used_configs.iterrows():
                config_id = config_row[ID]
                config_cores = config_row[ALLOCATED_CORES]
                if config_cores == "[]":
                    config_cores = "all"
                for tc_index, tc_row in used_tc.iterrows():
                    tc_id = tc_row[ID]
                    tc_name = tc_row[NAME]
                    tc_compiler = tc_row[COMPILER]
                    tc_language = tc_row[LANGUAGE]
                    tc_optimizations = tc_row[OPTIMIZATIONS]
                    tc_test_case_size = tc_row[TEST_CASE_SIZE]
                    tc_threads = tc_row[THREADS]

                    if dut_os == linux and tc_compiler == "msvc":
                        continue

                    tc_idle_case = query.get_idle_case(
                        used_idle_case,
                        tc_compiler,
                        tc_language,
                        tc_optimizations,
                        tc_test_case_size,
                        tc_threads,
                    )
                    tc_idle_case_id = int(tc_idle_case[ID].iloc[0])

                    key = f"{tc_name}.{dut_os}.{dut_name}.{config_cores}.{tc_compiler}.{mi_name}"
                    # key = f"{tc_name}.{mi_name}.{dut_name}.{config_cores}.{tc_compiler}.{dut_os}"
                    tc_collection = rep.get_collections(
                        db,
                        dut_id,
                        mi_id,
                        config_id,
                        tc_id,
                        experiment_name,
                        experiment_number,
                    )
                    tc_idle_case_collection = rep.get_collections(
                        db,
                        dut_id,
                        mi_id,
                        config_id,
                        tc_idle_case_id,
                        experiment_name,
                        experiment_number,
                    )

                    if tc_collection.shape[0] == 0:
                        print(f"N - {key}.{mi_row['SampleRate']}.{tc_id}")
                        continue
                    else:
                        print(f"Y - {key}.{mi_row['SampleRate']}.{tc_id}")

                    tc_collection_id = int(tc_collection[ID].iloc[0])
                    tc_idle_case_collection_id = int(
                        tc_idle_case_collection[ID].iloc[0]
                    )

                    tc_measurements = rep.get_measurements(db, tc_collection_id)
                    tc_idle_case_measurements = rep.get_measurements(
                        db, tc_idle_case_collection_id
                    )

                    dram_energy_results[key] = list(
                        tc_measurements["DramEnergyInJoules"]
                    )
                    cpu_energy_results[key] = list(tc_measurements["CpuEnergyInJoules"])
                    gpu_energy_results[key] = list(tc_measurements["GpuEnergyInJoules"])
                    duration_results[key] = list(tc_measurements["Duration"])
                    temperature_begin[key] = list(
                        tc_measurements["PackageTemperatureBegin"]
                    )
                    temperature_end[key] = list(
                        tc_measurements["PackageTemperatureEnd"]
                    )

                    idle_cpu_consumption = df_util.get_cpu_energy_per_time(
                        tc_idle_case_measurements,
                        tc_idle_case_measurements["Duration"].mean(),
                        used_test_case_name,
                    )
                    idle_gpu_consumption = df_util.get_gpu_energy_per_time(
                        tc_idle_case_measurements,
                        tc_idle_case_measurements["Duration"].mean(),
                        used_test_case_name,
                    )
                    idle_dram_consumption = df_util.get_dram_energy_per_time(
                        tc_idle_case_measurements,
                        tc_idle_case_measurements["Duration"].mean(),
                        used_test_case_name,
                    )

                    idle_cpu_consumption_results[key] = tc_idle_case_measurements[
                        "CpuEnergyInJoules"
                    ]

                    cpu_dynamic_energy_consumption[
                        key
                    ] = df_util.get_cpu_dynamic_energy(
                        tc_measurements,
                        idle_cpu_consumption,
                        tc_measurements["Duration"].mean(),
                        tc_name,
                    )

                    idle_cpu_watt_consumption = df_util.get_cpu_energy_per_time(
                        tc_idle_case_measurements,
                        1000,
                        used_test_case_name,
                    )

                    cpu_dynamic_energy_watt_consumption[
                        key
                    ] = df_util.get_cpu_dynamic_energy(
                        tc_measurements,
                        idle_cpu_watt_consumption,
                        1000,
                        tc_name,
                    )

                    gpu_dynamic_energy_consumption[
                        key
                    ] = df_util.get_gpu_dynamic_energy(
                        tc_measurements,
                        idle_gpu_consumption,
                        tc_measurements["Duration"].mean(),
                        tc_name,
                    )
                    dram_dynamic_energy_consumption[
                        key
                    ] = df_util.get_dram_dynamic_energy(
                        tc_measurements,
                        idle_dram_consumption,
                        tc_measurements["Duration"].mean(),
                        tc_name,
                    )

                    if scaphandre == mi_name:
                        key = f"{tc_name}.{dut_os}.{dut_name}.{config_cores}.{tc_compiler}.{mi_name}_isolated"
                        # key = f"{tc_name}.{mi_name}_isolated.{dut_name}.{config_cores}.{tc_compiler}.{dut_os}"
                        cpu_dynamic_energy_consumption[
                            key
                        ] = df_util.get_additional_metadata_dynamic_energy_consumption(
                            tc_measurements, tc_measurements["Duration"].mean(), tc_name
                        )
                        cpu_energy_results[key] = df_util.get_additional_metadata_total(
                            tc_measurements, tc_name
                        )

                        cpu_dynamic_energy_watt_consumption[
                            key
                        ] = df_util.get_additional_metadata_dynamic_energy_consumption(
                            tc_measurements, 1000, tc_name
                        )
