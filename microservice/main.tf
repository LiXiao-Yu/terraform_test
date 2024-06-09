resource "azurerm_service_plan" "app_service_plan" {
  name                = "my-app-service-plan"
  location            = var.avail_location
  resource_group_name = var.azurerm_resource_group_name
  os_type             = "Linux"
  sku_name            = "P1v2"
}

# deploy microservice
resource "azurerm_linux_web_app" "auth_service_app" {
  name                = "auth-service-app522"
  location            = var.avail_location
  resource_group_name = var.azurerm_resource_group_name
  service_plan_id = azurerm_service_plan.app_service_plan.id

  site_config {
    application_stack { 
      docker_image_name = var.docker_image
    }
  }
}

resource "azurerm_linux_web_app" "spa_service" {
  name                = "spa-service-app522"
  location            = var.avail_location
  resource_group_name = var.azurerm_resource_group_name
  service_plan_id = azurerm_service_plan.app_service_plan.id

  site_config {
    application_stack { 
      docker_image_name = var.docker_image
    }
  }
}

resource "azurerm_linux_web_app" "main_service" {
  name                = "main-service-app522"
  location            = var.avail_location
  resource_group_name = var.azurerm_resource_group_name
  service_plan_id = azurerm_service_plan.app_service_plan.id

  site_config {
    application_stack { 
      docker_image_name = var.docker_image
    }
  }
}