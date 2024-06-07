variable "azurerm_resource_group_name" {}
variable "avail_location" {}
variable "storage_account_name" {}
variable "storage_account_tier" { default = "Standard" }
variable "storage_account_replication_type" { default = "LRS" }
variable "storage_container_name" {}
variable "storage_container_access_type" { default = "private" }
variable "azurerm_sql_server_version" { default = "12.0" }
variable "administrator_login" {}
variable "administrator_login_password" {}
variable "azurerm_sql_server_name" {}
variable "azurerm_sql_database_name" {}
variable "azurerm_mssql_database_collation" {default = "SQL_Latin1_General_CP1_CI_AS"}
variable "azurerm_mssql_database_license_type" {default ="LicenseIncluded"}
variable "azurerm_mssql_database_zone_redundant" {default =false}
