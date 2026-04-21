resource "azurerm_windows_virtual_machine" "ops_vm" {
  name                = var.vm_name
  resource_group_name = azurerm_resource_group.ops.name
  location            = var.location
  size                = "Standard_B2als_v2"
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.ops_nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }
}