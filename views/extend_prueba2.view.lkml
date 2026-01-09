include: "/views/order_items_extended.view.lkml"
view: +order_items_extended {
  extends: [order_items_extended]
  # required_access_grants: [2_only]
  dimension: dimension_extendend2 {
    type: string
    sql: "2" ;;
  }

}
