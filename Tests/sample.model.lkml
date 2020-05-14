connection: "sample"

include: "*.view"
include: "Dynamic_Measures/*.view"

explore: sample {}

explore: shakespeare {}


#
# explore: base_table {
#   symmetric_aggregates: no
#   always_filter: {
#     filters: {
#       field: base_table.select_dimension
#       value: "City"
#     }
#   }
#
#   join: last_30_days {
#
#     sql_on: ${base_table.dim1}=${last_30_days.dim1} ;;
#     type: left_outer
#     relationship: one_to_one
#   }
#
#   join: dynamic_date_range {
#     sql_on: ${base_table.dim1} = ${dynamic_date_range.dim1} ;;
#     relationship: one_to_one
#   }
#
#   join: second_dynamic_date_range {
#     from: dynamic_date_range
#     sql_on: ${base_table.dim1} = ${second_dynamic_date_range.dim1} ;;
#     relationship: one_to_one
#   }
# }


explore: base_table {
  symmetric_aggregates: no
#   always_filter: {
#     filters: {
#       field: base_table.select_dimension
#       value: "City"
#     }
#   }

  join: last_30_days {

    sql_on: ${base_table.dim1}=${last_30_days.dim1} ;;
    type: left_outer
    relationship: one_to_one
  }

  join: dynamic_date_range {
    sql_on: ${base_table.dim1} = ${dynamic_date_range.dim1} ;;
    relationship: one_to_one
  }

  join: second_dynamic_date_range {
    from: dynamic_date_range
    sql_on: ${base_table.dim1} = ${second_dynamic_date_range.dim1} ;;
    relationship: one_to_one
  }
}

explore: liquor {}

explore: last_30_days {}

explore: dynamic_date_range {}
