# create AKS cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.azurerm_kubernetes_cluster_name
  location            = var.avail_location
  resource_group_name = var.azurerm_resource_group_name
  dns_prefix          = var.azurerm_kubernetes_cluster_dns_prefix
  private_cluster_enabled = true

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

}

# create acr
resource "azurerm_container_registry" "acr" {
  name                = var.azurerm_container_registry_name
  location            = var.avail_location
  resource_group_name = var.azurerm_resource_group_name
  sku                 = "Standard"
  admin_enabled       = true
}


