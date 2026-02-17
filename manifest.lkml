project_name: "pruebas_laura"

remote_dependency: laura_dev {
  url: "https://github.com/laura-diaz-dvt/laura_dev.git"
  # ref: "v1.1.1"
  ref: "master"
  # ref: "73cac06d556eb122689e92e9ef6797442fa424d4"

  override_constant: nombre_modelo_conneccion {
    value: "looker_pruebas_laura"
  }
}
