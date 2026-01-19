---
- dashboard: test_1
  title: Test 1
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 16hGqwn7WDtlYTZ2K7BMal
  theme_name: ''
  elements:
  - title: Untitled
    name: Untitled
    model: looker_pruebas_laura
    explore: order_items_extended
    type: looker_grid
    fields: [order_items_extended.product_id, order_items_extended.status, order_items_extended.sum_sales,
      order_items_extended.sale_price]
    sorts: [order_items_extended.sum_sales desc 0]
    limit: 10
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      order_items_extended.sum_sales:
        is_active: true
    series_value_format:
      order_items_extended.product_id:
        name: id
        format_string: '0'
        label: ID
    truncate_column_names: false
    defaults_version: 1
    title_hidden: true
    listen:
      Status: order_items_extended.status
      Sale Price: order_items_extended.sale_price
    row: 2
    col: 0
    width: 10
    height: 8
  - title: Untitled
    name: Untitled (2)
    model: looker_pruebas_laura
    explore: order_items_extended
    type: single_value
    fields: [order_items_extended.link_test_2]
    sorts: [order_items_extended.link_test_2]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    smart_single_value_size: true
    defaults_version: 1
    listen:
      Status: order_items_extended.status
      Sale Price: order_items_extended.sale_price
    row: 0
    col: 0
    width: 4
    height: 2
  filters:
  - name: Status
    title: Status
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: looker_pruebas_laura
    explore: order_items_extended
    listens_to_filters: []
    field: order_items_extended.status
  - name: Sale Price
    title: Sale Price
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: looker_pruebas_laura
    explore: order_items_extended
    listens_to_filters: []
    field: order_items_extended.sale_price
