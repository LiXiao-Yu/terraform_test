
# NOTE: the Name used for Redis needs to be globally unique
resource "azurerm_redis_cache" "cache" {
  name                = var.cache_name
  location            = var.avail_location
  resource_group_name = var.azurerm_resource_group_name
  capacity            = var.cache_capacity
  family              = var.cache_family
  sku_name            = var.cache_sku_name
  redis_configuration {
  }
}