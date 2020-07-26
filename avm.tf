# Create a resource group if it doesn't exist
resource "azurerm_resource_group" "example" {
    name     = "myTFResourceGroup"
    location = "southeastasia"

    tags = {
        environment = "Terraform Demo"
    }
}

# Create an SSH key
resource "tls_private_key" "example_ssh" {
  algorithm = "RSA"
  rsa_bits = 4096
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "example" {
  name                = "example-machine"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]
  disable_password_authentication = true
  
  admin_ssh_key {
        username       = "adminuser"
        public_key     = tls_private_key.example_ssh.public_key_openssh
    }

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
 
  tags = {
        environment = "Terraform Demo"
    }
}