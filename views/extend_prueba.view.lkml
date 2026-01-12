include: "/views/order_items_extended.view.lkml"
view: +order_items_extended {
  extends: [order_items_extended]
  dimension: dimension_extendend {
    type: string
    sql: "1" ;;
  }

  }
