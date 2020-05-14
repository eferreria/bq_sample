view: base_table {
  derived_table: {
    sql: select distinct city as dim1, county as dim2 from ${liquor.SQL_TABLE_NAME};;
  }

  dimension: dim1 {
    primary_key: yes
  }

  parameter: select_dimension {
    type: unquoted
    allowed_value: {
      label: "City"
      value: "city"
    }
    allowed_value: {
      label: "County"
      value: "county"
    }
    allowed_value: {
      label: "Catergory Name"
      value: "category_name"
    }
    default_value: "City"
  }
}
