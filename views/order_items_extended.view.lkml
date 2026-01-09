view: order_items_extended {
  # sql_table_name: `laura-diaz-sandbox-01.looker.order_items_extended` ;;
  sql_table_name: laura-diaz-sandbox-01.{% if _user_attributes['region'] == 'es' %}looker{% else %}looker2{% endif %}.order_items_extended;;
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
    required_access_grants: [can_see_status]
  }
  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: dataset {
    type: string
    sql: ${TABLE}.dataset ;;
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

  filter: status_filter {
    type: string
    description: "Filtra por status del pedido"
  }

  dimension: link_test_2 {
    type: string
    sql: (Select 'Test 2') ;;
    link: {
      label: "Test 2 "
      url: "/embed/dashboards/357?Status={{ _filters['order_items_extended.status'] | url_encode }}"
    }
    # link: {
    #   label: "Test 1 "
    #   url: "/embed/dashboards/356?Status={{ _filters['order_items_extended.status'] | url_encode }}"
    # }
    # html: <a href="/dashboards/357?Status={{ _filters['order_items_extended.status'] | url_encode}}" target="_blank" > 📊 {{rendered_value}} </a>;;
  }
  dimension: link_test_1 {
    type: string
    sql: (Select 'Test 1') ;;
    html: <a href="/dashboards/356?Status={{ _filters['order_items_extended.status'] | url_encode}}" target="_blank" > 📊 {{rendered_value}} </a>;;
  }

  measure: perc_n_contracts_vo_vs_obj {
    type: number
    sql: ${sum_sales} ;;
    value_format_name: "percent_2"

    html:
    <div title="N Contracts VO vs OBJ %: {{ rendered_value }}">
      {{ rendered_value }}
    </div>
  ;;
  }

  # measure: objetivo_avg_ind_1 {
  #   type: average
  #   sql: ${TABLE}.objetivo ;;
  #   link: {
  #     label: "Detalle"
  #     url: "/dashboards/3?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
  #   }
  #   value_format: "\"€/T \"0.00"
  # }

}
