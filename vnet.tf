
#vnet
resource "azurerm_virtual_network" "adex_suite_rtvt_vnet" {
  name                = "${var.app_name}-vnet"
  address_space       = var.address_space
  location            = azurerm_resource_group.adex_suite_rtvt_rg.location
  resource_group_name = azurerm_resource_group.adex_suite_rtvt_rg.name
}

#public_subnet
resource "azurerm_subnet" "adex_suite_rtvt_public_subnet" {
  name                 = "public-subnet"
  address_prefixes     = var.public_subnet
  resource_group_name  = azurerm_resource_group.adex_suite_rtvt_rg.name
  virtual_network_name = azurerm_virtual_network.adex_suite_rtvt_vnet.name
}

resource "azurerm_subnet_network_security_group_association" "adex_suite_rtvt_nsg_association_public" {
  subnet_id                 = azurerm_subnet.adex_suite_rtvt_public_subnet.id
  network_security_group_id = azurerm_network_security_group.adex_suite_rtvt_nsg.id
}


