variable "location" {}
variable "resource_group" {}
variable "vnet_cidr" {}
variable "subnet_cidr" {}

# File: modules/aks/main.tf
resource "azurerm_kubernetes_cluster" "main" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B1s"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "dev"
    Owner       = "vinoth"
  }
}
