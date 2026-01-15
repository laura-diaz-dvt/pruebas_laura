---
- dashboard: clour_run_adk
  title: clour run adk
  layout: newspaper
  description: ''
  preferred_slug: 8iEyyaH5YoNeUynqMKi7S4
  elements:
  - title: Count of Order Items (Extended)
    name: Count of Order Items (Extended)
    model: looker_pruebas_laura
    explore: order_items_extended
    type: single_value
    fields: [order_items_extended.count]
    limit: 500
    row:
    col:
    width:
    height:
  - title: Count of Completed Returned Order Items by Month (2022)
    name: Count of Completed Returned Order Items by Month (2022)
    model: looker_pruebas_laura
    explore: order_items_extended
    type: looker_column
    fields: [order_items_extended.returned_month, order_items_extended.count]
    filters:
      order_items_extended.status: complete
      order_items_extended.returned_year: '2022'
    sorts: [order_items_extended.returned_month]
    limit: 500
    row:
    col:
    width:
    height:
  - title: Count of Returned Order Items by Month (2022)
    name: Count of Returned Order Items by Month (2022)
    model: looker_pruebas_laura
    explore: order_items_extended
    type: looker_column
    fields: [order_items_extended.returned_month, order_items_extended.count]
    filters:
      order_items_extended.returned_year: '2022'
    sorts: [order_items_extended.returned_month]
    limit: 500
    row:
    col:
    width:
    height:
