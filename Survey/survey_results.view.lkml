view: survey_results {
  sql_table_name: `sample-224021.sample.survey_results`
    ;;

  dimension: email_address {
    type: string
    sql: ${TABLE}.Email_Address ;;
  }

  dimension: state {
    type: string
    sql: substr(${where_are_you_from_}, length(${where_are_you_from_})-1) ;;
  }

  dimension: have_you_logged_into_your_looker_instance_ {
    type: yesno
    sql: ${TABLE}.Have_you_logged_into_your_Looker_instance_ ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: rate_your_business_intelligence__bi__background {
    type: string
    sql: ${TABLE}.Rate_your_business_intelligence__BI__background ;;
  }

  dimension: rate_your_looker_background {
    type: string
    sql: ${TABLE}.Rate_your_Looker_background ;;
  }

  dimension: rate_your_sql_background {
    type: string
    sql: ${TABLE}.Rate_your_SQL_Background ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.Timestamp ;;
  }

  dimension: what_are_you_most_excited_about_this_workshop_ {
    type: string
    sql: ${TABLE}.What_are_you_most_excited_about_this_workshop_ ;;
  }

  dimension: what_is_your__quarantine__snack_ {
    type: string
    sql: ${TABLE}.What_is_your__quarantine__snack_ ;;
  }

  dimension: where_are_you_from_ {
    type: string
    sql: ${TABLE}.Where_are_you_from_ ;;
  }

  dimension: which_bi_application_tool_have_you_used_before_ {
    type: string
    sql: ${TABLE}.Which_BI_Application_Tool_have_you_used_before_ ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
