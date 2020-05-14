view: dynamic_date_range {
    derived_table: {
      sql:
          select city as dim1, count(1) as measure_count, sum(btl_price*bottle_qty) as measure_sum
          from ${liquor.SQL_TABLE_NAME}
          where process_date between {% date_start select_date_range %} and {% date_end select_date_range  %}
          group by 1
          ;;
    }

    filter: select_date_range {
      type: date
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
