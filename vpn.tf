# Create virtual network
resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

   tags = {
        environment = "Terraform Demo"
    }
}

# Create subnet
resource "azurerm_subnet" "example" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes       = ["10.0.2.0/24"]
}


# Create public IPs
resource "azurerm_public_ip" "examplepublicip" {
    name                         = "examplepublicip"
    location                     = azurerm_resource_group.example.location
    resource_group_name          = azurerm_resource_group.example.name
    allocation_method            = "Dynamic"

    tags = {
        environment = "Terraform Demo"
    }
}

# Create network interface
resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.examplepublicip.id
  }

  tags = {
        environment = "Terraform Demo"
    }
}