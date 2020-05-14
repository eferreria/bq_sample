view: liquor {
    derived_table: {
      sql: SELECT cast(date as timestamp) process_date, store, name, address, city, zipcode, county
              , category_name
              , vendor
              , description
              , pack, liter_size, state_btl_cost, btl_price, bottle_qty
              FROM `fh-bigquery.liquor.iowa`
               ;;
    }

    dimension_group: process {
      type: time
      timeframes: [raw, date, week, month, quarter, year]
      sql: ${TABLE}.process_date ;;
      datatype: datetime
    }

    dimension: store {
      type: string
      sql: ${TABLE}.store ;;
    }

    dimension: name {
      type: string
      sql: ${TABLE}.name ;;
    }

    dimension: address {
      type: string
      sql: ${TABLE}.address ;;
    }

    dimension: city {
      type: string
      sql: ${TABLE}.city ;;
    }

    dimension: zipcode {
      type: string
      sql: ${TABLE}.zipcode ;;
    }

    dimension: county {
      type: string
      sql: ${TABLE}.county ;;
    }

    dimension: category_name {
      type: string
      sql: ${TABLE}.category_name ;;
    }

    dimension: vendor {
      type: string
      sql: ${TABLE}.vendor ;;
    }

    dimension: description {
      type: string
      sql: ${TABLE}.description ;;
    }

    dimension: pack {
      type: number
      sql: ${TABLE}.pack ;;
    }

    dimension: liter_size {
      type: number
      sql: ${TABLE}.liter_size ;;
    }

    dimension: state_btl_cost {
      type: number
      sql: ${TABLE}.state_btl_cost ;;
    }

    dimension: btl_price {
      type: number
      sql: ${TABLE}.btl_price ;;
    }

    dimension: bottle_qty {
      type: number
      sql: ${TABLE}.bottle_qty ;;
    }

    set: detail {
      fields: [
        process_date,
        store,
        name,
        address,
        city,
        zipcode,
        county,
        category_name,
        vendor,
        description,
        pack,
        liter_size,
        state_btl_cost,
        btl_price,
        bottle_qty
      ]
    }
  }
