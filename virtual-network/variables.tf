variable "location" {}

variable "resource_group_name" {}

variable "virtual_network_name" {
    description = "Name of the virtual network"
    type        = string
    default     = "my-vnet"
}