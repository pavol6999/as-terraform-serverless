#-----------------------------------------------------------------------
#  MONGO DB   
#-----------------------------------------------------------------------


resource "mongodbatlas_project" "project_as" {
  name   = var.mongodb_atlas_project.name
  org_id = var.mongodb_atlas_project.org_id

  is_collect_database_specifics_statistics_enabled = true
  is_data_explorer_enabled                         = true
  is_performance_advisor_enabled                   = true
  is_realtime_performance_panel_enabled            = true
  is_schema_advisor_enabled                        = true
}



resource "mongodbatlas_serverless_instance" "serverless_db" {
  project_id = mongodbatlas_project.project_as.id
  name       = "${var.mongodb_atlas_project.name}-serverless-instance"

  provider_settings_backing_provider_name = "AWS"
  provider_settings_provider_name         = "SERVERLESS"
  provider_settings_region_name           = "EU_WEST_1"
}




resource "mongodbatlas_database_user" "user" {
  username           = var.username
  password           = var.password
  project_id         = mongodbatlas_project.project_as.id
  auth_database_name = "admin"

  roles {
    role_name     = "readWriteAnyDatabase"
    database_name = "admin"
  }
}
