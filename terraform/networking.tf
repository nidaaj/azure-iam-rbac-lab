resource "azurerm_virtual_network" "ops_vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.ops.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "ops_subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.ops.name
  virtual_network_name = azurerm_virtual_network.ops_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "ops_pip" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = azurerm_resource_group.ops.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_network_interface" "ops_nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = azurerm_resource_group.ops.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.ops_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.ops_pip.id
  }
}