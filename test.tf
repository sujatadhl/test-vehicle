
# #module for vnet and vm
# module "vnet" {
#   source              = "Azure/vnet/azurerm"
#   version             = "4.1.0"
#   use_for_each        = var.use_for_each
#   resource_group_name = azurerm_resource_group.adex_suite_rtvt-rg.name
#   vnet_location       = var.location
#   address_space       = var.address_space
#   vnet_name           = "${var.app_name}-vnet"
#   subnet_names        = ["${var.app_name}-subnet1"]
#   subnet_prefixes     = ["10.0.0.0/28"]
#   nsg_ids = {
#     "${var.app_name}-subnet1" = azurerm_network_security_group.nsg.id
#   }
# }
# module "azurerm_linux_virtual_machine" {
#   source                              = "intel/azure-linux-vm/intel"
#   version                             = "2.0.1"

#   azurerm_resource_group_name         = azurerm_resource_group.adex_suite_rtvt-rg.name
#   azurerm_virtual_network_name        = module.vnet.vnet_name
#   virtual_network_resource_group_name = azurerm_resource_group.adex_suite_rtvt-rg.name
#   azurerm_subnet_name                 ="adex_suite_rtvt-subnet1"
#   admin_password                      = var.admin_password
#   priority                            = "Spot"
#   max_bid_price                       = "0.0874"
#   eviction_policy                     = "Deallocate"
#   source_image_reference = {
#     publisher = "Canonical"
#     offer     = "0001-com-ubuntu-server-jammy"
#     sku       = "22_04-lts-gen2"
#     version   = "latest"
#   }
# }