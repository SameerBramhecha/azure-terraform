# This Terraform configuration file defines a Windows Virtual Machine Scale Set in Azure.
# Define a resource for an Azure Windows Virtual Machine Scale Set
resource "azurerm_windows_virtual_machine_scale_set" "windows_vm_scale_set" {
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

  # SKU configuration for the VM scale set
  sku = var.vm_size

  instances            = 2
  computer_name_prefix = "vm-"

  # Source image configuration for the VM instances
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter-Server-Core"
    version   = "latest"
  }

  # Network interface configuration for the VM instances
  network_interface {
    name    = "network-interface-1"
    primary = true

    ip_configuration {
      name      = "ipconfig"
      primary   = true
      subnet_id = var.subnet_id
    }
  }

  # OS disk configuration for the VM instances
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 127
  }
}
