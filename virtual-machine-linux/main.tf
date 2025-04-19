# Define a Linux virtual machine resource in Azure
resource "azurerm_linux_virtual_machine" "linux_vm" {
    # Name of the virtual machine
    name                            = var.vm_name
    # Resource group where the VM will be created
    resource_group_name             = var.resource_group_name
    # Azure region for the VM
    location                        = var.location
    # Size of the virtual machine
    size                            = var.vm_size
    # Disable password authentication (set to false to allow password-based login)
    disable_password_authentication = false
    # Admin username for the VM
    admin_username                  = var.admin_username
    # Admin password for the VM
    admin_password                  = var.admin_password
    # Network interface ID to associate with the VM
    network_interface_ids           = [var.nic_id]

    # OS disk configuration
    os_disk {
        # Caching mode for the OS disk
        caching              = "ReadWrite"
        # Storage account type for the OS disk
        storage_account_type = "Standard_LRS"
    }

    # Source image configuration for the VM
    source_image_reference {
        # Publisher of the image
        publisher = "Canonical"
        # Offer of the image
        offer     = "UbuntuServer"
        # SKU of the image
        sku       = "18.04-LTS"
        # Version of the image
        version   = "latest"
    }
}
