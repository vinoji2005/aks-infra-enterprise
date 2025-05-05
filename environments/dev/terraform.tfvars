location       = "East US"
resource_group = "rg-app-dev"
aks_name       = "aks-sre-dev"
dns_prefix     = "aksdev"
vnet_cidr      = "10.0.0.0/16"
subnet_cidr    = "10.0.1.0/24"
tags = {
  Environment = "dev"
  Owner       = "vinoth"
  Project     = "aks-sre"
  CostCenter  = "devops"
  CreatedBy   = "terraform"
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