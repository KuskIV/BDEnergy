import pandas as pd
from utils.column_name_utils import *


def get_devices_under_test(db):
    query = "select * from DeviceUnderTest"
    parameters = []

    data = db.query_all(query, parameters)

    return pd.DataFrame(data, columns=["Id", "Name", "Os", "Env"])


def get_prod_devices_under_test(db):
    return _get_devices_under_test_from_env(db, "prod")


def get_dev_devices_under_test(db):
    return _get_devices_under_test_from_env(db, "dev")


def get_test_cases(db):
    query = "select * from TestCase"
    parameters = []
    columns = [
        ID,
        NAME,
        "Compiler",
        "Language",
        "Optimizations",
        "TestCaseSize",
        "Parameter",
        "Threads",
    ]

    return _query_all_with(query, parameters, columns, db)


def get_measuring_instruments(db):
    query = "select * from MeasuringInstrument"
    parameters = []
    columns = ["Id", "Name", "SampleRate"]

    return _query_all_with(query, parameters, columns, db)


def get_configurations(db):
    query = "select * from Configuration"
    parameters = []
    columns = ["Id", "MinTemp", "MaxTemp", "Burnin", "AllocatedCores"]

    return _query_all_with(query, parameters, columns, db)


def get_distinct_experiments(db):
    query = "select distinct CollectionNumber, Name from MeasuringCollection"
    parameters = []
    columns = ["Experiment", "Name"]

    return _query_all_with(query, parameters, columns, db)


def get_measurements(db, collection_id):
    query = "select * from Measurement WHERE CollectionId = %s"
    parameters = [collection_id]
    columns = [
        ID,
        "Iteration",
        "CollectionId",
        "PackageTemperatureBegin",
        "PackageTemperatureEnd",
        "Duration",
        "DramEnergyInJoules",
        "GpuEnergyInJoules",
        "CpuEnergyInJoules",
        "BeginTime",
        "EndTime",
        "AdditionalMetadata",
    ]

    return _query_all_with(query, parameters, columns, db)


def get_collections(
    db, dut_id, mi_id, config_id, tc_id, experiment_name, experiment_number
):
    query = "select * from MeasuringCollection WHERE DutId = %s AND MeasuringInstrumentId = %s AND ConfigurationId = %s AND TestCaseId = %s AND Name = %s AND CollectionNumber = %s"
    parameters = [dut_id, mi_id, config_id, tc_id, experiment_name, experiment_number]
    columns = [
        ID,
        NAME,
        "ConfigurationId",
        "TestCaseId",
        "DutId",
        "MeasuringInstrumentId",
        "AdditionalMetadata",
        "CollectionNumber",
    ]

    return _query_all_with(query, parameters, columns, db)


def _get_devices_under_test_from_env(db, env):
    query = "select * from DeviceUnderTest WHERE Env = %s"
    parameters = [env]
    columns = ["Id", "Name", "Os", "Env"]

    return _query_all_with(query, parameters, columns, db)


def _query_all_with(query, parameters, columns, db):
    data = db.query_all(query, parameters)

    return pd.DataFrame(data, columns=columns)
