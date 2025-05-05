variable "location" {}
variable "resource_group" {}
variable "vnet_cidr" {}
variable "subnet_cidr" {}
variable "tags" {
  type = map(string)
}