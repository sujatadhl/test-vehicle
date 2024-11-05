resource "azurerm_public_ip" "public_ip" {
  name                = "${var.app_name}-public-ip"
  resource_group_name = azurerm_resource_group.adex_suite_rtvt_rg.name
  location            = azurerm_resource_group.adex_suite_rtvt_rg.location
  allocation_method   = "Static"
  sku                 = "Standard"
}
