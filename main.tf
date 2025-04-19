# Module for creating a resource group
module "resource-group" {
  source = "./resource-group"
}

# Module for creating a storage account (currently commented out)
# Uncomment and configure if a storage account is needed
# module "storage-account"{
#     source = "./storage-account"
#     location = module.resource-group.location
#     resource_group_name     = module.resource-group.name
# }

# Module for creating a virtual network
module "virtual-network" {
  source              = "./virtual-network"
  location            = module.resource-group.location
  resource_group_name = module.resource-group.name
}

# Module for creating a public IP address
module "public-ip" {
  source              = "./public-ip"
  location            = module.resource-group.location
  resource_group_name = module.resource-group.name
}

# # Module for creating a network interface card (NIC)
# module "network-interface-card" {
#   source              = "./network-interface-card"
#   location            = module.resource-group.location
#   resource_group_name = module.resource-group.name
#   public_ip_id        = module.public-ip.public_ip_id  # Associates the NIC with the public IP
#   subnet_id           = module.virtual-network.subnet1_id  # Associates the NIC with a subnet
# }

# # Module for creating a Linux virtual machine
# module "linux-vm" {
#   source              = "./virtual-machine-linux"
#   location            = module.resource-group.location
#   resource_group_name = module.resource-group.name
#   nic_id              = module.network-interface-card.nic_id  # Attaches the NIC to the VM
# }

# Module for creating a Linux virtual machine
# module "windows-vm" {
#   source              = "./virtual-machine-windows"
#   location            = module.resource-group.location
#   resource_group_name = module.resource-group.name
#   nic_id              = module.network-interface-card.nic_id  # Attaches the NIC to the VM
# }

# module "vm-scale-set-linux" {
#   source              = "./vm-scale-set-linux"
#   location            = module.resource-group.location
#   resource_group_name = module.resource-group.name
#   subnet_id           = module.virtual-network.subnet1_id  # Associates the VM scale set with a subnet
#   vm_name             = "my-linux-vm-scale-set"  # Name of the VM scale set
#   vm_size             = "Standard_B1s"  # Size of the VM instances in the scale set
#   # admin_username      = ""  # Admin username for the VM instances
#   # admin_password      = ""  # Admin password for the VM instances
# }

module "vm-scale-set-windows" {
  source              = "./vm-scale-set-windows"
  location            = module.resource-group.location
  resource_group_name = module.resource-group.name
  subnet_id           = module.virtual-network.subnet1_id  # Associates the VM scale set with a subnet
  vm_name             = "my-windows-vm-scale-set"  # Name of the VM scale set
  vm_size             = "Standard_B1s"  # Size of the VM instances in the scale set
  # admin_username      = ""  # Admin username for the VM instances
  # admin_password      = ""  # Admin password for the VM instances
}
