resource "azurerm_network_interface" "public_network_interface" {
  name                = "${var.app_name}-nic-public"
  location            = azurerm_resource_group.adex_suite_rtvt_rg.location
  resource_group_name = azurerm_resource_group.adex_suite_rtvt_rg.name
  ip_configuration {
    name                          = "public"
    subnet_id                     = azurerm_subnet.adex_suite_rtvt_public_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}


