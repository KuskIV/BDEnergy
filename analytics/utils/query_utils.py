from utils.column_name_utils import *


def get_idle_case(
    ic, ic_compiler, ic_language, ic_optimization, ic_test_case_size, ic_threads
):
    used_ic = ic.query(
        f"{COMPILER} == '{ic_compiler}' and "
        + f"{LANGUAGE} == '{ic_language}' and "
        + f"{OPTIMIZATIONS} == '{ic_optimization}' and "
        + f"{TEST_CASE_SIZE} == '{ic_test_case_size}' and "
        + f"{THREADS} == '{ic_threads}'"
    )

    if len(used_ic) != 1:
        raise Exception(
            f"Multiple idle cases match compiler '{ic_compiler}', '{ic_language}', '{ic_optimization}', '{ic_test_case_size}', '{ic_threads}'"
        )

    return used_ic


def get_mi_query(
    used_mi_names,
    ipg,
    lhm,
    rapl,
    plug,
    clamp,
    scaphandre,
    ipg_sample_rate,
    lhm_sample_rate,
    rapl_sample_rate,
    plug_sample_rate,
    clamp_sample_rate,
    scaphandre_sample_rate,
):
    used_mi_query_list = []

    if ipg in used_mi_names:
        used_mi_query_list.append(
            f"({NAME} == '{ipg}' and {SAMPLE_RATE} == {ipg_sample_rate})"
        )

    if lhm in used_mi_names:
        used_mi_query_list.append(
            f"({NAME} == '{lhm}' and {SAMPLE_RATE} == {lhm_sample_rate})"
        )

    if rapl in used_mi_names:
        used_mi_query_list.append(
            f"({NAME} == '{rapl}' and {SAMPLE_RATE} == {rapl_sample_rate})"
        )

    if plug in used_mi_names:
        used_mi_query_list.append(
            f"({NAME} == '{plug}' and {SAMPLE_RATE} == {plug_sample_rate})"
        )

    if clamp in used_mi_names:
        used_mi_query_list.append(
            f"({NAME} == '{clamp}' and {SAMPLE_RATE} == {clamp_sample_rate})"
        )

    if scaphandre in used_mi_names:
        used_mi_query_list.append(
            f"({NAME} == '{scaphandre}' and {SAMPLE_RATE} == {scaphandre_sample_rate})"
        )

    return used_mi_query_list
