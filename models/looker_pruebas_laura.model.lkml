connection: "laura-diaz-sandbox-01"

include: "/views/*.view.lkml"                # include all views

explore: order_items {}

explore: order_items_extended {
  # bloquea completamente el explore si el usuario no tiene el permiso
  required_access_grants: [test_grant]

  # filtra datos según el atributo del usuario
  access_filter: {
    field: order_items_extended.status
    user_attribute: test_status
  }

  # filtra los datos a todos los usuarios por una dimension
  # sql_always_where: ${order_items_extended.status} != 'cancelled' ;;

  # filtra los datos a todos los usuarios por una medida
  # sql_always_having: ${order_items_extended.count} > 1000 ;;
}

access_grant: test_grant {
  user_attribute: test_grant
  allowed_values: ["yes"]
}

access_grant: can_see_status {
  user_attribute: status_filter
  allowed_values: ["yes"]
}
