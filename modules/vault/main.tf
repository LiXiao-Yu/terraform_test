data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "app_vault" {
  name                        = var.azurerm_key_vault_name
  location                    = var.avail_location
  resource_group_name         = var.azurerm_resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = var.azurerm_key_vault_name_soft_delete_retention_days
  purge_protection_enabled    = false
  enabled_for_template_deployment = true
  sku_name = "standard"
  
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get","List","Create","Update","Delete","Recover","Backup","Restore","Purge"
    ]
    secret_permissions = [
      "Get","List","Set","Delete","Recover","Backup","Restore"
    ]
    certificate_permissions = [
      "Get","List","Delete","Create","Import","Update"
    ]
  }
}

resource "azurerm_key_vault_secret" "db_username" {
  name         = var.db_name
  value        = var.db_name_info
  key_vault_id = azurerm_key_vault.app_vault.id
}

resource "azurerm_key_vault_secret" "db_password" {
  name         = var.db_password_name
  value        = var.db_password_info
  key_vault_id = azurerm_key_vault.app_vault.id
}
