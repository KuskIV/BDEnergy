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
