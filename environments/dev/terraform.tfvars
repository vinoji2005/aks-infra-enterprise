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
