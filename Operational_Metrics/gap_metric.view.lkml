view: gap_metric {
  derived_table: {
    sql: select 'Jan' as _date,
'https://raw.githubusercontent.com/eferreria/bq_sample/master/dog.jpg' as url
union all
select  'Feb' as _date,
'https://raw.githubusercontent.com/eferreria/bq_sample/master/cat.jpeg' as url
union all
select 'Mar' as _date,
'https://raw.githubusercontent.com/eferreria/bq_sample/master/rabbit.png' as url
;;
  }
  dimension: date_month {
    sql: ${TABLE}._date ;;
  }

  dimension: url {}

  dimension: image {
    sql: ${url} ;;
    html: <img src="{{value}}"> ;;
  }
}
