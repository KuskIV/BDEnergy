from utils.column_name_utils import *
import utils.results_repository as rep
import utils.dataframe_utils as df_util


def get_time_series(
    used_dut,
    used_mi,
    used_configs,
    used_tc,
    experiment_name,
    experiment_number,
    linux,
    windows,
    windows_mi,
    linux_mi,
    time_series_used,
    db,
    scaphandre,
):
    time_series = {}
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

                    tc_collection = rep.get_collections(
                        db,
                        dut_id,
                        mi_id,
                        config_id,
                        tc_id,
                        experiment_name,
                        experiment_number,
                    )
                    key = f"{tc_name}.{mi_name}.{dut_name}.{config_cores}.{tc_compiler}.{dut_os}"

                    if tc_collection.shape[0] == 0:
                        print(f"N - {key}.{mi_row['SampleRate']}.{tc_id}")
                        continue
                    else:
                        print(f"begin - {key}.{mi_row['SampleRate']}.{tc_id}")

                    tc_collection_id = int(tc_collection[ID].iloc[0])
                    tc_measurements = rep.get_measurements(db, tc_collection_id)
                    time_series[key] = []

                    for (
                        measurement_index,
                        measurement_row,
                    ) in tc_measurements.iterrows():
                        for (
                            collection_index,
                            collection_row,
                        ) in tc_collection.iterrows():
                            measurement_id = measurement_row["Id"]
                            collection_id = collection_row["Id"]

                            ts = rep.get_time_series(db, collection_id, measurement_id)
                            time_series[key].append(ts)

                            if mi_name == scaphandre:
                                key = f"{tc_name}.{mi_name}_isolated.{dut_name}.{config_cores}.{tc_compiler}.{dut_os}"
                                isolated_column = df_util.get_additional_metadata_total(
                                    ts, tc_name
                                )
                                isolated_ts = ts.copy()
                                isolated_ts["CpuEnergyInJoules"] = isolated_column
                                if not key in time_series:
                                    time_series[key] = []
                                time_series[key].append(isolated_ts)
                        if len(time_series[key]) >= time_series_used:
                            break
                    print(f"done")
    return time_series
