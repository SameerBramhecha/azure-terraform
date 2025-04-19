# This Terraform configuration file defines a Linux Virtual Machine Scale Set in Azure.
# Define a resource for an Azure Linux Virtual Machine Scale Set
resource "azurerm_linux_virtual_machine_scale_set" "linux_vm_scale_set" {
  # Name of the VM scale set
  name = var.vm_name

  # Location where the VM scale set will be deployed  
  location = var.location

  # Name of the resource group to associate with the VM scale set
  resource_group_name = var.resource_group_name

  # Admin username for the VM instances
  admin_username = var.admin_username

  # Admin password for the VM instances
  admin_password = var.admin_password

  disable_password_authentication = false

  # SKU configuration for the VM scale set
  sku = var.vm_size

  instances = 2

  # Source image configuration for the VM instances
  source_image_reference {
    # Publisher of the image
    publisher = "Canonical"

    # Offer of the image
    offer = "UbuntuServer"

    # SKU of the image
    sku = "18.04-LTS"

    # Version of the image
    version = "latest"
  }

  # Network interface configuration for the VM instances
  network_interface {
    # Name of the network interface
    name = "network-interface-1"

    # Set this network interface as the primary one
    primary = true

    # IP configuration for the network interface
    ip_configuration {
      # Name of the IP configuration
      name = "ipconfig"

      # Set this IP configuration as the primary one
      primary = true

      # Subnet ID for the network interface
      subnet_id = var.subnet_id
    }
  }

  # OS disk configuration for the VM instances
  os_disk {
    # Caching mode for the OS disk
    caching = "ReadWrite"

    # Type of managed disk
    storage_account_type = "Standard_LRS"

    # Size of the OS disk in GB
    disk_size_gb = 30
  }
}
