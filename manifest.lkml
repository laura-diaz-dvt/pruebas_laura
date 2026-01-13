project_name: "pruebas_laura"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }
remote_dependency: laura_dev2 {
  url: "https://github.com/laura-diaz-dvt/laura_dev2.git"
  ref: "477d74010f9fbee8437aeaa6e798650155abc9bd" # Aquí usas el SHA del commit de la versión antigua
}
