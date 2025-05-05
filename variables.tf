variable "location" {}
variable "resource_group" {}
variable "aks_name" {}
variable "dns_prefix" {}
variable "vnet_cidr" {}
variable "subnet_cidr" {}
variable "tags" {
  type = map(string)
}
