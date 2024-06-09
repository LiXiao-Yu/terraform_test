output "cache_name" {
  value = module.cache.cache_name
}

output "gateway_name" {
  value = module.gateway.gateway_name
}

output "storage_account_name" {
  value = module.storage.storage_account_name
}

output "storage_container_blog_name" {
  value = module.storage.storage_container_blog_name
}

output "storage_mssql_server_name" {
  value = module.storage.storage_mssql_server_name
}

output "storage_mssql_db_name" {
  value = module.storage.storage_mssql_db_name
}

output "vault_name" {
  value = data.azurerm_key_vault_secret.db_username.name
}

output "vault_password" {
  value = data.azurerm_key_vault_secret.db_password.name
}

output "auth_service_app" {
  value = module.microservice.auth_service_app_name
}

output "spa_service" {
  value = module.microservice.spa_service_name
}

output "main_service" {
  value = module.microservice.main_service_name
}