import math


def get_cochran(values, Z, E):
    mean = sum(values) / len(values)
    nominator = 0

    for v in values:
        nominator += (v - mean) ** 2

    result = nominator / len(values)

    std = math.sqrt(result)

    n_zero = ((Z**2) * (std**2)) / (E**2)

    return n_zero


def exclude_outliers(df, column):
    index = list(df.columns).index(column)
    _, used_df_plot_data = df.boxplot(return_type="both")

    used_df_outliers = [flier.get_ydata() for flier in used_df_plot_data["fliers"]]
    used_df_without_outlisers = [
        x for x in list(df[column]) if x not in list(used_df_outliers[index])
    ]

    return used_df_without_outlisers
