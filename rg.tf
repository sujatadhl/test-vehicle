resource "azurerm_resource_group" "adex_suite_rtvt_rg" {
  location = var.location
  name     = "${var.app_name}-rg"
}