# Define a Windows virtual machine resource in Azure
resource "azurerm_windows_virtual_machine" "windows_vm" {
  # Name of the virtual machine
  name = var.vm_name
  # Resource group where the VM will be created
  resource_group_name = var.resource_group_name
  # Azure region for the VM
  location = var.location
  # Size of the virtual machine
  size = var.vm_size
  # Admin username for the VM
  admin_username = var.admin_username
  # Admin password for the VM
  admin_password = var.admin_password
  # Network interface ID to associate with the VM
  network_interface_ids = [var.nic_id]

  # OS disk configuration
  os_disk {
    # Caching mode for the OS disk
    caching = "ReadWrite"
    # Storage account type for the OS disk
    storage_account_type = "Standard_LRS"
  }

  # Source image configuration for the VM
  source_image_reference {
    # Publisher of the image
    publisher = "MicrosoftWindowsDesktop"
    # Offer of the image
    offer = "Windows-10"
    # SKU of the image
    sku = "win10-21h2-pro"
    # Version of the image
    version = "latest"
  }
}
