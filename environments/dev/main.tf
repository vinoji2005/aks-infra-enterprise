module "network" {
  source         = "../modules/vnet"
  location       = var.location
  resource_group = var.resource_group
  vnet_cidr      = var.vnet_cidr
  subnet_cidr    = var.subnet_cidr
  tags           = var.tags
}

module "aks" {
  source           = "../modules/aks"
  location         = var.location
  resource_group   = var.resource_group
  aks_name         = var.aks_name
  dns_prefix       = var.dns_prefix
  subnet_id        = module.network.subnet_id
  tags             = var.tags
}
