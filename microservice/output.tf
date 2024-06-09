output "auth_service_app_name" {
  value = azurerm_linux_web_app.auth_service_app.name
}

output "spa_service_name" {
  value = azurerm_linux_web_app.spa_service.name
}

output "main_service_name" {
  value = azurerm_linux_web_app.main_service.name
}