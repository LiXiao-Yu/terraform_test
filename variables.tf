# resource group
variable "azurerm_resource_group_name" {}
variable "avail_location" {}
# VPC info
variable "azurerm_virtual_network_name" {}
variable "azurerm_virtual_network_address" {}
# subnet info
variable "subnet_name" {}
variable "subnet_address" {}
# public ip
variable "public_ip_name" {}
variable "public_ip_allocation_method" { default = "Static" }
variable "public_ip_sku" { default = "Standard" }
# gateway
variable "app_gateway_name" {}
variable "gateway_sku_name" { default = "Standard_v2" }
variable "gateway_sku_tier" { default = "Standard_v2" }
variable "gateway_ip_configuration" {}
variable "gateway_frontend_ip_configuration_private_allocation" { default = "Static" }
variable "gateway_frontend_ip_configuration_private_ip_address" {}
variable "gateway_backend_http_settings_cookie_based_affinity" { default = "Disabled" }
variable "gateway_backend_http_settings_path" { default = "/path1/" }
variable "gateway_backend_http_settings_protocol" { default = "Http" }
variable "gateway_http_listener_protocol" { default = "Http" }
variable "gateway_request_routing_rule_type" { default = "Basic" }
# storage
variable "storage_account_name" {}
variable "storage_container_name" {}
variable "azurerm_sql_server_name" {}
variable "azurerm_sql_database_name" {}
# cache
variable "cache_name" {}
# vault
variable "azurerm_key_vault_name" {}
variable "db_name" {}
variable "db_name_info" {}
variable "db_password_name" {}
variable "db_password_info" {}
# k8s
variable "azurerm_kubernetes_cluster_name" {}
variable "azurerm_container_registry_name" {}
variable "azurerm_kubernetes_cluster_dns_prefix" {}
