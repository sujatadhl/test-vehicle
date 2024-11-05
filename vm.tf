resource "azurerm_linux_virtual_machine" "linux_vm_public" {
  name                            = "${var.app_name}-vm"
  resource_group_name             = azurerm_resource_group.adex_suite_rtvt_rg.name
  computer_name                   = "AdexSuite"
  location                        = azurerm_resource_group.adex_suite_rtvt_rg.location
  size                            = "Standard_D2s_v3"
  admin_username                  = "adminuser"
  admin_password                  = "Test#1"
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.public_network_interface.id]
  priority                        = "Spot"
  max_bid_price                   = "0.874"
  eviction_policy                 = "Deallocate"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
  custom_data = base64encode(data.template_file.linux-vm-cloud-init.rendered)
}
data "template_file" "linux-vm-cloud-init" {
  template = file("user-data.sh")
}

 