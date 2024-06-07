# since these variables are re-used - a locals block makes this more maintainable
locals {
  backend_address_pool_name              = "${var.azurerm_virtual_network_name}-beap"
  frontend_port_name                     = "${var.azurerm_virtual_network_name}-feport"
  frontend_ip_configuration_name         = "${var.azurerm_virtual_network_name}-feip"
  http_setting_name                      = "${var.azurerm_virtual_network_name}-be-htst"
  listener_name                          = "${var.azurerm_virtual_network_name}-httplstn"
  request_routing_rule_name              = "${var.azurerm_virtual_network_name}-rqrt"
  redirect_configuration_name            = "${var.azurerm_virtual_network_name}-rdrcfg"
  frontend_ip_configuration_private_name = "${var.azurerm_virtual_network_name}_private"
}

resource "azurerm_application_gateway" "app_gateway" {
  name                = var.app_gateway_name
  resource_group_name = var.azurerm_resource_group_name
  location            = var.azurerm_resource_group_location

  sku {
    name     = var.gateway_sku_name
    tier     = var.gateway_sku_tier
    capacity = 2
  }

  gateway_ip_configuration {
    name      = var.gateway_ip_configuration
    subnet_id = var.azurerm_subnet_id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = var.azurerm_public_ip_id
  }

  frontend_ip_configuration {
    name                          = local.frontend_ip_configuration_private_name
    subnet_id                     = var.azurerm_subnet_id
    private_ip_address_allocation = var.gateway_frontend_ip_configuration_private_allocation
    private_ip_address            = var.gateway_frontend_ip_configuration_private_ip_address
  }

  backend_address_pool {
    name = local.backend_address_pool_name
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = var.gateway_backend_http_settings_cookie_based_affinity
    path                  = var.gateway_backend_http_settings_path
    port                  = 80
    protocol              = var.gateway_backend_http_settings_protocol
    request_timeout       = 10
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = var.gateway_http_listener_protocol
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    priority                   = 9
    rule_type                  = var.gateway_request_routing_rule_type
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
  }
}
