

view: shakespeare {
  sql_table_name: {{_user_attributes['company_project']}}.samples.shakespeare
    ;;

  dimension: corpus {
    type: string
    sql: ${TABLE}.corpus ;;
  }

  dimension: corpus_date {
    type: number
    sql: ${TABLE}.corpus_date ;;
  }

  dimension: word {
    type: string
    sql: ${TABLE}.word ;;
  }

  dimension: word_count {
    type: number
    sql: ${TABLE}.word_count ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
