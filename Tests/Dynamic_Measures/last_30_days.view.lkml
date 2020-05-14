view: last_30_days {
  derived_table: {
    sql:
    select city as dim1, count(1) as measure_count
    , sum(btl_price*bottle_qty) as measure_sum
    from ${liquor.SQL_TABLE_NAME}
    where process_date >= ((TIMESTAMP_ADD(TIMESTAMP_TRUNC( TIMESTAMP('2014-07-01 00:00:00'), DAY), INTERVAL -29 DAY)))
    AND (process_date ) < ((TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC( TIMESTAMP('2014-07-01 00:00:00'), DAY), INTERVAL -29 DAY), INTERVAL 30 DAY)))
    group by 1
    ;;
  }
dimension: dim1 {
  primary_key: yes
  hidden: yes
}

dimension: measure_count {
  hidden: yes
}

  dimension: measure_sum {
    hidden: yes
  }

measure: total_count {
  type: sum
  sql: ${measure_count} ;;
}

  measure: total_price {
    type: sum
    sql: ${measure_sum} ;;
  }

 }
