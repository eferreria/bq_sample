view: accenture_survey {
  sql_table_name: sample.accenture_survey ;;

  dimension: email_address {
    type: string
    sql: ${TABLE}.Email_Address ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: bi_background {
    label: "Business Intelligence Rating"
    type: string
    sql: ${TABLE}.Rate_your_business_intelligence__BI__background ;;
  }

  dimension: rate_your_looker_background {
    label: "Looker Background"
    type: string
    sql: ${TABLE}.Rate_your_Looker_background ;;
  }

  dimension: rate_your_sql_background {
    type: string
    label: "SQL Background"
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
    label: "Most Exciting Topic"
    type: string
    sql: ${TABLE}.What_are_you_most_excited_about_this_workshop_ ;;
  }

  dimension: what_is_your__quarantine__snack_ {
    type: string
    label: "Quarantine Snack"
    sql: ${TABLE}.What_is_your__quarantine__snack_ ;;
  }

  dimension: where_are_you_from_ {
    type: string
    label: "Location"
    sql: ${TABLE}.Where_are_you_from_ ;;
  }

  dimension: which_bi_application_tool_have_you_used_before_ {
    type: string
    label: "Business Intelligence Application"
    sql: ${TABLE}.Which_BI_Application_Tool_have_you_used_before_ ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
