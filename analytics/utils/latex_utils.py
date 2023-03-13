def get_ytick_labels(
    data,
    used_test_case_names,
    used_mi_names,
    used_dut_name,
    used_allocated_cores,
    used_compiler_str,
):
    yticklables = []
    for l in data.columns:
        column_data = l.split(".")
        l_test_case = column_data[0]
        l_measuring_instrument = column_data[2]
        l_dut_name = column_data[3]
        l_allocated_cores = column_data[4]
        l_compiler = column_data[5]

        if len(l_allocated_cores) == 2:
            l_allocated_cores = "all"

        yticklables.append(
            _get_ytick_lable(
                used_test_case_names,
                l_test_case,
                used_mi_names,
                l_measuring_instrument,
                used_dut_name,
                l_dut_name,
                used_allocated_cores,
                l_allocated_cores,
                used_compiler_str,
                l_compiler,
            )
        )

    return yticklables


def get_boxes(data):
    _, box_plot_data = data.boxplot(return_type="both")

    outliers = [flier.get_ydata() for flier in box_plot_data["fliers"]]
    boxes = [box.get_ydata() for box in box_plot_data["boxes"]]
    medians = [median.get_ydata() for median in box_plot_data["medians"]]
    whiskers = [whiskers.get_ydata() for whiskers in box_plot_data["whiskers"]]

    latex_boxes = ""
    for d in zip(outliers, boxes, medians, range(len(outliers))):
        o = d[0]
        b = d[1]
        m = d[2]
        i = d[3]

        w1 = whiskers[i * 2]
        w2 = whiskers[(i * 2) + 1]

        out = _parse_outliers(o, i)
        lq, uq = _parse_boxes(b)
        lw, uw = _parse_whiskers(w1, w2)
        me = _parse_median(m)
        col = "red"
        latex_boxes += _get_box_template(lw, lq, me, uq, uw, col, out)

    return latex_boxes


def _get_ytick_lable(
    used_test_case_names,
    l_test_case,
    used_mi_names,
    l_measuring_instrument,
    used_dut_name,
    l_dut_name,
    used_allocated_cores,
    l_allocated_cores,
    used_compiler_str,
    l_compiler,
):
    ylable = ""

    if len(used_test_case_names) > 1:
        ylable += " " + l_test_case

    if len(used_mi_names) > 1:
        ylable += " " + l_measuring_instrument

    if len(used_dut_name) > 1:
        ylable += " " + l_dut_name

    if len(used_allocated_cores) > 1:
        ylable += " " + l_allocated_cores

    if len(used_compiler_str) > 1:
        ylable += " " + l_compiler

    return ylable


def _parse_outliers(outliers, i):
    parsed_input = ""

    for o in outliers:
        parsed_input += f"({i},{o})"

    return parsed_input


def _parse_boxes(boxes):
    lower_quartile = boxes[0]
    upper_quartile = boxes[2]

    return lower_quartile, upper_quartile


def _parse_whiskers(w1, w2):
    return w1[1], w2[1]


def _parse_median(median):
    return median[0]


def _get_box_template(lw, lq, m, uq, uw, c, co):
    return """
        \\addplot+ [boxplot prepared={{
                lower whisker={0},
                lower quartile={1},
                median={2},
                upper quartile={3},
                upper whisker={4}
                }}, color = {5}
                ] coordinates{{{6}}};
        """.format(
        lw, lq, m, uq, uw, c, co
    )
