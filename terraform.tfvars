azurerm_resource_group_name                          = "staff_sales_app_group"
avail_location                                       = "Southeast Asia"
azurerm_virtual_network_name                         = "staff_sales_app_network"
azurerm_virtual_network_address                      = ["10.0.0.0/16"]
subnet_name                                          = "staff_sales_app_subnet"
subnet_address                                       = ["10.0.0.0/24"]
public_ip_name                                       = "staff_sales_app_public_ip"
app_gateway_name                                     = "staff_sales_app_gateway"
gateway_ip_configuration                             = "app-ip-configuration"
gateway_frontend_ip_configuration_private_ip_address = "10.0.0.20"
storage_account_name                                 = "appsales1"
storage_container_name                               = "appcontainer"
cache_name                                           = "app-cache"
azurerm_sql_server_name                              = "staff-sale-app-db"
azurerm_sql_database_name                            = "appsqldatabase"
azurerm_key_vault_name                               = "appkeyvault111"
db_name                                              = "administrator-login"
db_name_info                                         = "4dm1n157r470r"
db_password_name                                     = "administrator-login-password"
db_password_info                                     = "4-v3ry-53cr37-p455w0rd"
azurerm_kubernetes_cluster_name                      = "appaks"
azurerm_container_registry_name                      = "appacr0001"
azurerm_kubernetes_cluster_dns_prefix                = "appaks"

