output "storage_account_name" {
    value = azurerm_storage_account.app_blog_storage.name
}

output "storage_container_blog_name" {
    value = azurerm_storage_container.app_blog_storage.name
}

output "storage_mssql_server_name" {
    value = azurerm_mssql_server.sql_server.name
}

output "storage_mssql_db_name" {
    value = azurerm_mssql_database.db.name
}