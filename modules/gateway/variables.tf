variable "app_gateway_name" {}
variable "gateway_sku_name" { default = "Standard_v2" }
variable "gateway_sku_tier" { default = "Standard_v2" }
variable "gateway_ip_configuration" {}
variable "gateway_frontend_ip_configuration_private_allocation" {default = "Static"}
variable "gateway_frontend_ip_configuration_private_ip_address" {}
variable "gateway_backend_http_settings_cookie_based_affinity" { default = "Disabled" }
variable "gateway_backend_http_settings_path" { default = "/path1/" }
variable "gateway_backend_http_settings_protocol" { default = "Http" }
variable "gateway_http_listener_protocol" { default = "Http" }
variable "gateway_request_routing_rule_type" { default = "Basic" }
variable "azurerm_resource_group_name" {}
variable "azurerm_resource_group_location" {}
variable "azurerm_subnet_id" {}
variable "azurerm_public_ip_id" {}
variable "azurerm_virtual_network_name" {}


