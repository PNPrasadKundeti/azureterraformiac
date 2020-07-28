resource "azurerm_managed_disk" "example" {
  name                 = "${local.vm_name}-disk1"
  location             = azurerm_resource_group.example.location
  resource_group_name  = azurerm_resource_group.example.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 11
}

resource "azurerm_virtual_machine_data_disk_attachment" "example" {
  managed_disk_id    = azurerm_managed_disk.example.id
  virtual_machine_id = azurerm_linux_virtual_machine.example.id
  lun                = "1"
  caching            = "ReadWrite"
}