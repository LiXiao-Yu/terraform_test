variable "azurerm_resource_group_name" {}
variable "avail_location" {}
variable "cache_name" {}
variable "cache_capacity" { default = 2 }
variable "cache_family" {default = "C"}
variable "cache_sku_name" {default = "Standard"}