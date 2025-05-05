resource "azurerm_virtual_network" "main" {
  name                = "vnet-aks"
  address_space       = [var.vnet_cidr]
  location            = var.location
  resource_group_name = var.resource_group
  tags                = var.tags
}

resource "azurerm_subnet" "main" {
  name                 = "subnet-aks"
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.subnet_cidr]
}

output "subnet_id" {
  value = azurerm_subnet.main.id
}
