resource "azurerm_storage_account" "storage_account" {
  name                     = "adexsitestorageacc"
  resource_group_name      = azurerm_resource_group.adex_suite_rtvt_rg.name
  location                 = azurerm_resource_group.adex_suite_rtvt_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
resource "azurerm_storage_container" "container" {
  name                  = "${var.app_name}-container"
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "container"
}
resource "azurerm_storage_blob" "blob" {
  name                   = "${var.app_name}-blob"
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = azurerm_storage_container.container.name
  type                   = "Block"
}