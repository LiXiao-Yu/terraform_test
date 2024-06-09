# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.95.0"
    }
  }
}

# configure the Microsoft Azure Provider
provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

# create resource group
resource "azurerm_resource_group" "app_rg" {
  name     = var.azurerm_resource_group_name
  location = var.avail_location
}

# create networks within the resource group
resource "azurerm_virtual_network" "app_vn" {
  name                = var.azurerm_virtual_network_name
  resource_group_name = azurerm_resource_group.app_rg.name
  location            = azurerm_resource_group.app_rg.location
  address_space       = var.azurerm_virtual_network_address
}

resource "azurerm_subnet" "app_subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.app_rg.name
  virtual_network_name = azurerm_virtual_network.app_vn.name
  address_prefixes     = var.subnet_address
}

resource "azurerm_public_ip" "app_public_ip" {
  name                = var.public_ip_name
  resource_group_name = azurerm_resource_group.app_rg.name
  location            = azurerm_resource_group.app_rg.location
  allocation_method   = var.public_ip_allocation_method
  sku                 = var.public_ip_sku
}

# create gateway for App
module "gateway" {
  source = "./modules/gateway"

  azurerm_resource_group_name                          = azurerm_resource_group.app_rg.name
  azurerm_resource_group_location                      = azurerm_resource_group.app_rg.location
  azurerm_subnet_id                                    = azurerm_subnet.app_subnet.id
  azurerm_public_ip_id                                 = azurerm_public_ip.app_public_ip.id
  azurerm_virtual_network_name                         = azurerm_virtual_network.app_vn.name
  gateway_frontend_ip_configuration_private_ip_address = var.gateway_frontend_ip_configuration_private_ip_address
  gateway_ip_configuration                             = var.gateway_ip_configuration
  app_gateway_name                                     = var.app_gateway_name
}

# create blog and DB
module "storage" {
  source = "./modules/storage"

  azurerm_resource_group_name  = azurerm_resource_group.app_rg.name
  avail_location               = azurerm_resource_group.app_rg.location
  storage_account_name         = var.storage_account_name
  storage_container_name       = var.storage_container_name
  administrator_login          = data.azurerm_key_vault_secret.db_username.value
  administrator_login_password = data.azurerm_key_vault_secret.db_password.value
  azurerm_sql_server_name      = var.azurerm_sql_server_name
  azurerm_sql_database_name    = var.azurerm_sql_database_name
}

# create cache
module "cache" {
  source = "./modules/cache"

  azurerm_resource_group_name = azurerm_resource_group.app_rg.name
  avail_location              = azurerm_resource_group.app_rg.location
  cache_name                  = var.cache_name
}

# DB info stored in key vault
data "azurerm_key_vault" "vault" {
  name                = var.key_vault_name
  resource_group_name = var.key_vault_resource_group
}

data "azurerm_key_vault_secret" "db_username" {
  name         = var.db_name
  key_vault_id = data.azurerm_key_vault.vault.id
}

data "azurerm_key_vault_secret" "db_password" {
  name         = var.db_password_name
  key_vault_id = data.azurerm_key_vault.vault.id
}

# create 3 micro services
module "microservice" {
  source                      = "./microservice"
  azurerm_resource_group_name = azurerm_resource_group.app_rg.name
  avail_location              = azurerm_resource_group.app_rg.location
  # can change that if need the image form storage
  # variable "docker_image" { default = "appsvc/staticsite:latest" }
}

# if kubernetes needed, can build a new one
# module "kubernetes" {
#   source = "./modules/kubernetes"

#   azurerm_resource_group_name           = azurerm_resource_group.app_rg.name
#   avail_location                        = azurerm_resource_group.app_rg.location
#   azurerm_kubernetes_cluster_name       = var.azurerm_kubernetes_cluster_name
#   azurerm_container_registry_name       = var.azurerm_container_registry_name
#   azurerm_kubernetes_cluster_dns_prefix = var.azurerm_kubernetes_cluster_dns_prefix
#   # azurerm_private_dns_zone_id           = azurerm_private_dns_zone.app_dns_zone.id
# }

