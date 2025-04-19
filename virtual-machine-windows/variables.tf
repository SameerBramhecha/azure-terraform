# The location where the resources will be deployed
variable "location" {}

# The name of the resource group where the virtual machine will be created
variable "resource_group_name" {}

# The ID of the network interface card (NIC) to associate with the virtual machine
variable "nic_id" {}

# The name of the virtual machine
variable "vm_name" {
    description = "Name of the virtual machine"
    type        = string
    default     = "myVMWindows"
}

# The size of the virtual machine (e.g., Standard_B1s, Standard_D2s_v3)
variable "vm_size" {
    description = "Size of the virtual machine"
    type        = string
    default     = "Standard_B1s"
}

# The admin username for the virtual machine
variable "admin_username" {
    description = "Admin username for the virtual machine"
    type        = string
    # default     = ""
}

# The admin password for the virtual machine
variable "admin_password" {
    description = "Admin password for the virtual machine"
    type        = string
    # default     = ""
}