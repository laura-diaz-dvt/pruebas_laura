connection: "laura-diaz-sandbox-01"

include: "/views/*.view.lkml"                # include all views

explore: order_items {}
 #laura
explore: order_items_extended {
  # blocks the explore if the user does not have the permission, the value of the user attribute must match
  required_access_grants: [test_grant]

  # filters data according to the user's attribute
  access_filter: {
    field: order_items_extended.status
    user_attribute: test_status
  }

  # filters data for all users by a dimension
  # sql_always_where: ${order_items_extended.status} != 'cancelled' ;;

  # filters data for all users by a measure
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

access_grant: 2_only {
  user_attribute: region
  allowed_values: ["es"]
}
