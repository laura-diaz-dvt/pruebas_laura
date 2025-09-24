view: order_items_extended {
  sql_table_name: `laura-diaz-sandbox-01.looker.order_items_extended` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension_group: delivered {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.delivered_at ;;
  }
  dimension: inventory_item_id {
    type: number
    sql: ${TABLE}.inventory_item_id ;;
  }
  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }
  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }
  dimension_group: returned {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }
  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }
  dimension_group: shipped {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.shipped_at ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: sum_sales {
    type: sum
    sql: ${sale_price} ;;
  }

  measure: order_count_last_year {
    type: period_over_period
    description: "Order count from the previous year"
    based_on: order_items_extended.count
    based_on_time: order_items_extended.created_year
    period: year
    kind: previous
  }


  measure: sales_last_year_yes {
    type: period_over_period
    description: "Sales from the previous year"
    based_on: order_items_extended.sum_sales
    based_on_time: order_items_extended.created_year
    period: year
    kind: previous
    value_to_date: yes
  }

  measure: sales_last_year_no {
    type: period_over_period
    description: "Sales from the previous year"
    based_on: order_items_extended.sum_sales
    based_on_time: order_items_extended.created_year
    period: year
    kind: previous
    value_to_date: no
  }

}
