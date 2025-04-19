# Define a network interface resource in Azure
resource "azurerm_network_interface" "nic" {
  # Name of the network interface
  name     = "nic"
  
  # Location where the network interface will be created
  location = var.location
  
  # Resource group to which the network interface belongs
  resource_group_name = var.resource_group_name

  # Configuration for the IP settings of the network interface
  ip_configuration {
    # Name of the IP configuration
    name                          = "ipconfig1"
    
    # ID of the subnet to associate with the network interface
    subnet_id                     = var.subnet_id
    
    # Allocation method for the private IP address (Dynamic or Static)
    private_ip_address_allocation = "Dynamic"
    
    # ID of the public IP address to associate with the network interface
    public_ip_address_id          = var.public_ip_id
  }
}
