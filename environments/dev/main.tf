module "network" {
  source         = "../../modules/vnet"
  resource_group = var.resource_group
  location       = var.location
  vnet_cidr      = var.vnet_cidr
  subnet_cidr    = var.subnet_cidr
  tags           = var.tags
}

module "aks" {
  source           = "../../modules/aks"
  resource_group   = var.resource_group
  location         = var.location
  aks_name         = var.aks_name
  dns_prefix       = var.dns_prefix
  subnet_id        = module.network.subnet_id
  tags             = var.tags
}

# File: modules/vnet/main.tf
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