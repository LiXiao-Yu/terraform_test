resource "azurerm_storage_account" "app_blog_storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.azurerm_resource_group_name
  location                 = var.avail_location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
}

# blog resource
resource "azurerm_storage_container" "app_blog_storage" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.app_blog_storage.name
  container_access_type = var.storage_container_access_type
}

# DB resource
resource "azurerm_mssql_server" "sql_server" {
  name                         = var.azurerm_sql_server_name
  resource_group_name          = var.azurerm_resource_group_name
  location                     = var.avail_location
  version                      = var.azurerm_sql_server_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
}

resource "azurerm_mssql_database" "db" {
  name                = var.azurerm_sql_database_name
  server_id = azurerm_mssql_server.sql_server.id
  collation      =var.azurerm_mssql_database_collation
  license_type   = var.azurerm_mssql_database_license_type
  zone_redundant = var.azurerm_mssql_database_zone_redundant

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = false
  }
}



