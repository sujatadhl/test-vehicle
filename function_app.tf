resource "azurerm_service_plan" "app_service" {
  name                = "${var.app_name}-app-service"
  location            = azurerm_resource_group.adex_suite_rtvt_rg.location
  resource_group_name = azurerm_resource_group.adex_suite_rtvt_rg.name
  sku_name            = "Y1"
  os_type             = "Linux"
}
resource "azurerm_linux_function_app" "function_app" {
  name                       = var.app_name
  location                   = azurerm_resource_group.adex_suite_rtvt_rg.location
  resource_group_name        = azurerm_resource_group.adex_suite_rtvt_rg.name
  service_plan_id            = azurerm_service_plan.app_service.id
  storage_account_name       = azurerm_storage_account.storage_account.name
  storage_account_access_key = azurerm_storage_account.storage_account.primary_access_key
  public_network_access_enabled = true
  # app_settings {
  #   FUNCTIONS_WORKER_RUNTIME = "python"
  # }
  site_config  {
    # linux_fx_verison = "python|3.10"
  }
}