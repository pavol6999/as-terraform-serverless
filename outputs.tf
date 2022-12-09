output "serverless_mongodb" {
  value = mongodbatlas_serverless_instance.serverless_db
}

output "serverless_user" {
  sensitive = true
  value     = mongodbatlas_database_user.user
}

output "conn" {
  value = local.connection_uri
}
