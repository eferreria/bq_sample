- dashboard: operational_metrics__thrive
  title: Operational Metrics - Thrive
  layout: newspaper
  embed_style:
    background_color: "#ffffff"
    show_title: false
    title_color: "#3a4245"
    show_filters_bar: false
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - name: ''
    type: text
    body_text: <a type="button" class="btn btn-info btn-lg btn-block" href="https://bethematchstaging.looker.com/embed/dashboards/5">Thrive</a>
    row: 0
    col: 4
    width: 4
    height: 2
  - title: Pillar Header
    name: Pillar Header
    model: operational_metrics
    explore: operational_metrics
    type: single_value
    fields: [operational_metrics.pillar, operational_metrics.pillar_header]
    filters:
      operational_metrics.event_fiscal_year: 1 fiscal years
      operational_metrics.pillar: Thrive
      operational_metrics.event_date: this month
    sorts: [operational_metrics.pillar_header desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: false
    single_value_title: ''
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: [operational_metrics.pillar]
    listen: {}
    row: 2
    col: 0
    width: 24
    height: 3
  - title: Thrive
    name: Thrive
    model: operational_metrics
    explore: operational_metrics
    type: single_value
    fields: [operational_metrics.metric_month_actual, operational_metrics.event_fiscal_month_num]
    pivots: [operational_metrics.event_fiscal_month_num]
    filters:
      operational_metrics.pillar: Thrive
      operational_metrics.event_date: this month, last month
    sorts: [operational_metrics.metric_month_actual desc 0, operational_metrics.event_fiscal_month_num
        desc]
    limit: 500
    query_timezone: America/Chicago
    custom_color_enabled: true
    custom_color: "#0079c1"
    show_single_value_title: true
    single_value_title: Current Month
    value_format: "#,###"
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Last Month
    series_types: {}
    listen: {}
    row: 5
    col: 1
    width: 5
    height: 4
  - title: Thrive YTD
    name: Thrive YTD
    model: operational_metrics
    explore: operational_metrics
    type: single_value
    fields: [operational_metrics.metric_year_actual, operational_metrics.event_fiscal_year]
    pivots: [operational_metrics.event_fiscal_year]
    fill_fields: [operational_metrics.event_fiscal_year]
    filters:
      operational_metrics.pillar: Thrive
      operational_metrics.event_date: this month, 12 months ago for 1 month
    sorts: [operational_metrics.event_fiscal_year desc]
    limit: 500
    query_timezone: America/Chicago
    custom_color_enabled: true
    custom_color: "#0079c1"
    show_single_value_title: true
    single_value_title: Current YTD
    value_format: "#,###"
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Prior FYTD
    series_types: {}
    listen: {}
    row: 5
    col: 7
    width: 5
    height: 4
  - title: New Tile
    name: New Tile
    model: operational_metrics
    explore: operational_metrics
    type: single_value
    fields: [operational_metrics.metric_year_actual, operational_metrics.metric_year_goal,
      operational_metrics.yearly_status]
    filters:
      operational_metrics.pillar: Thrive
      operational_metrics.event_date: this month
    limit: 500
    dynamic_fields: [{table_calculation: year_progress, label: Year Progress, expression: "${operational_metrics.metric_year_actual}/${operational_metrics.metric_year_goal}",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Chicago
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: circle_outline
    series_colors:
      YTD - operational_metrics.metric_month_actual: "#0079c1"
      YTD - operational_metrics.metric_month_goal: "#bdcc2a"
    series_labels:
      Thrive - actual_running_total: Thrive - Actual
      Thrive - goal_running_total: Thrive - Goal
    series_point_styles:
      Thrive - goal_running_total: diamond
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    ordering: none
    show_null_labels: false
    show_dropoff: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [operational_metrics.metric_year_actual, operational_metrics.metric_year_goal,
      year_progress]
    listen: {}
    row: 17
    col: 5
    width: 14
    height: 2
  - name: '21'
    type: text
    body_text: <a type="button" class="btn btn-secondary btn-lg btn-block" href="https://bethematchstaging.looker.com/embed/dashboards/5"><font
      color="#0079c1">Overview</font></a>
    row: 0
    col: 0
    width: 4
    height: 2
  - name: '2b'
    type: text
    body_text: <a type="button" class="btn btn-secondary btn-lg btn-block" href="https://bethematchstaging.looker.com/embed/dashboards/5"><font
      color="#0079c1">Lives</font></a>
    row: 0
    col: 12
    width: 4
    height: 2
  - name: '2c'
    type: text
    body_text: <a type="button" class="btn btn-secondary btn-lg btn-block" href="https://bethematchstaging.looker.com/embed/dashboards/5"><font
      color="#0079c1">Service</font></a>
    row: 0
    col: 16
    width: 4
    height: 2
  - name: '2d'
    type: text
    body_text: <a type="button" class="btn btn-secondary btn-lg btn-block" href="https://bethematchstaging.looker.com/embed/dashboards/5"><font
      color="#0079c1">Stewardship</font></a>
    row: 0
    col: 20
    width: 4
    height: 2
  - title: Monthly Performance
    name: Monthly Performance
    model: operational_metrics
    explore: operational_metrics
    type: looker_column
    fields: [operational_metrics.event_month_name, operational_metrics.event_fiscal_month_num,
      operational_metrics.metric_month_actual, operational_metrics.event_fiscal_year]
    pivots: [operational_metrics.event_fiscal_year]
    fill_fields: [operational_metrics.event_fiscal_year]
    filters:
      operational_metrics.pillar: Thrive
      operational_metrics.event_fiscal_month_num: "<=10"
    sorts: [operational_metrics.event_fiscal_month_num, operational_metrics.event_fiscal_year
        desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: yoy_change, label: YoY Change, expression: "(pivot_index(${operational_metrics.metric_month_actual},1)-pivot_index(${operational_metrics.metric_month_actual},2))/pivot_index(${operational_metrics.metric_month_actual},2)",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: supermeasure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: Actual, orientation: left, series: [{axisId: operational_metrics.metric_month_actual,
            id: 2019 - operational_metrics.metric_month_actual, name: FY2019}, {axisId: operational_metrics.metric_month_actual,
            id: 2018 - operational_metrics.metric_month_actual, name: FY2018}], showLabels: true,
        showValues: true, minValue: !!null '', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: yoy_change, id: yoy_change, name: "%Change YoY"}], showLabels: true,
        showValues: true, minValue: !!null '', unpinAxis: true, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    legend_position: center
    series_types:
      2018 - operational_metrics.metric_month_actual: line
      yoy_change: area
    point_style: circle_outline
    series_colors:
      yoy_change: "#f8981d"
    series_labels:
      yoy_change: "%Change YoY"
      2019 - operational_metrics.metric_month_actual: FY2019
      2018 - operational_metrics.metric_month_actual: FY2018
    series_point_styles:
      yoy_change: diamond
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#009ca7",
        line_value: '270', label: Delivered (270)}, {reference_type: line, range_start: max,
        range_end: min, margin_top: deviation, margin_value: mean, margin_bottom: deviation,
        label_position: left, color: "#f8981d", line_value: '265', label: Improved
          (265)}, {reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#95358c",
        line_value: '275', label: Crushed (275)}]
    trend_lines: []
    ordering: none
    show_null_labels: false
    column_spacing_ratio: 0
    column_group_spacing_ratio: 0.5
    show_dropoff: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [operational_metrics.event_fiscal_month_num]
    listen: {}
    row: 9
    col: 1
    width: 11
    height: 8
  - title: Year To Date Performance
    name: Year To Date Performance
    model: operational_metrics
    explore: operational_metrics
    type: looker_column
    fields: [operational_metrics.metric_month_actual, operational_metrics.metric_month_goal,
      operational_metrics.event_fiscal_month_num, operational_metrics.event_fiscal_year,
      operational_metrics.event_month_name, operational_metrics.metric_year_actual,
      operational_metrics.metric_year_goal]
    pivots: [operational_metrics.event_fiscal_year]
    fill_fields: [operational_metrics.event_fiscal_year]
    filters:
      operational_metrics.pillar: Thrive
      operational_metrics.event_fiscal_month_num: "<=10"
    sorts: [operational_metrics.event_fiscal_year desc, operational_metrics.event_fiscal_month_num]
    limit: 500
    dynamic_fields: [{table_calculation: actual_running_total, label: actual_running_total,
        expression: 'running_total(${operational_metrics.metric_month_actual})', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}, {
        table_calculation: goal_running_total, label: goal_running_total, expression: 'running_total(${operational_metrics.metric_month_goal})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: current_year_running_total, label: Current
          Year Running Total, expression: 'pivot_index(${actual_running_total},1)',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: current_year_cumulative_goal, label: Current
          Year Cumulative Goal, expression: 'pivot_index(${goal_running_total},1)',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: last_year_running_total, label: Last
          Year Running Total, expression: 'pivot_index(${actual_running_total},2)',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: gap_to_goal, label: Gap to Goal,
        expression: "${current_year_running_total}-${current_year_cumulative_goal}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: ytd_running_percent, label: YTD Running
          Percent, expression: "${current_year_running_total}/${operational_metrics.metric_year_goal}",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}, {table_calculation: current_year_ytd, label: Current
          Year YTD %, expression: 'pivot_index(${ytd_running_percent}, 1)', value_format: !!null '',
        value_format_name: percent_0, _kind_hint: supermeasure, _type_hint: number}]
    query_timezone: America/Chicago
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: current_year_running_total,
            id: current_year_running_total, name: Current Year Running Total}, {axisId: current_year_cumulative_goal,
            id: current_year_cumulative_goal, name: Current Year Cumulative Goal},
          {axisId: gap_to_goal, id: gap_to_goal, name: Gap to Goal}], showLabels: true,
        showValues: true, maxValue: 3300, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types:
      operational_metrics.metric_month_goal: line
      actual_running_total: area
      goal_running_total: line
      Thrive - goal_running_total: line
      current_year_goals: line
      last_year_rt: line
      current_year_running_total: area
      current_year_cumulative_goal: line
      percent_change_yoy: line
      gap_to_goal: area
      current_year_ytd: area
    point_style: circle_outline
    series_colors:
      YTD - operational_metrics.metric_month_actual: "#0079c1"
      YTD - operational_metrics.metric_month_goal: "#bdcc2a"
      gap_to_goal: "#f8981d"
    series_labels:
      Thrive - actual_running_total: Thrive - Actual
      Thrive - goal_running_total: Thrive - Goal
    series_point_styles:
      Thrive - goal_running_total: diamond
      percent_change_yoy: diamond
      current_year_cumulative_goal: square
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#009ca7",
        line_value: '3250', label: Delivered (3250)}]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [operational_metrics.metric_month_goal, operational_metrics.metric_month_actual,
      operational_metrics.event_fiscal_month_num, actual_running_total, goal_running_total,
      last_year_running_total, operational_metrics.metric_year_actual, operational_metrics.metric_year_goal,
      ytd_running_percent, current_year_ytd]
    listen: {}
    row: 9
    col: 13
    width: 11
    height: 8
  - title: Thrive YTD (copy)
    name: Thrive YTD (copy)
    model: operational_metrics
    explore: operational_metrics
    type: single_value
    fields: [operational_metrics.percent_progress_of_year, operational_metrics.metric_year_goal,
      operational_metrics.yearly_status]
    filters:
      operational_metrics.pillar: Thrive
      operational_metrics.event_date: this month
    limit: 500
    query_timezone: America/Chicago
    custom_color_enabled: true
    custom_color: "#0079c1"
    show_single_value_title: true
    single_value_title: of YTD Goal Completed
    value_format: ''
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: FY2019 Goal
    series_types: {}
    listen: {}
    row: 5
    col: 13
    width: 5
    height: 4
  - title: Thrive YTD (copy 2)
    name: Thrive YTD (copy 2)
    model: operational_metrics
    explore: operational_metrics
    type: single_value
    fields: [operational_metrics.annualized_actual, operational_metrics.crushed, operational_metrics.improved,
      operational_metrics.metric_year_goal]
    filters:
      operational_metrics.pillar: Thrive
      operational_metrics.event_date: this month
    sorts: [operational_metrics.annualized_actual desc]
    limit: 500
    dynamic_fields: [{table_calculation: status, label: Status, expression: "if(${operational_metrics.annualized_actual}>=\
          \ ${operational_metrics.crushed}, concat(\"Crushed: \",to_string(${operational_metrics.crushed})),\n\
          \  if(${operational_metrics.annualized_actual}>=${operational_metrics.metric_year_goal},\
          \ concat(\"Delivered: \",${operational_metrics.metric_year_goal}),\n   \
          \ concat(\"Improved: \", ${operational_metrics.improved})\n    )\n  )",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: string}]
    query_timezone: America/Chicago
    custom_color_enabled: true
    custom_color: "#0079c1"
    show_single_value_title: true
    single_value_title: Annualized
    value_format: ''
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: YTD Goal
    series_types: {}
    hidden_fields: [operational_metrics.crushed, operational_metrics.improved, operational_metrics.metric_year_goal]
    listen: {}
    row: 5
    col: 19
    width: 5
    height: 4
  - name: '2e'
    type: text
    body_text: <a type="button" class="btn btn-secondary btn-lg btn-block" href="https://bethematchstaging.looker.com/embed/dashboards/23"><font
      color="#0079c1">Equality</font></a>
    row: 0
    col: 8
    width: 4
    height: 2
