# Network Security Group (NSG) definition
# This resource creates a Network Security Group named "nsg-vnet" in the specified location and resource group.
resource "azurerm_network_security_group" "nsg" {
    # Name of the Network Security Group
    name                = "nsg-vnet"
    # Location where the NSG will be created
    location            = var.location
    # Resource group in which the NSG will reside
    resource_group_name = var.resource_group_name
}

# Virtual Network definition
# This resource creates a Virtual Network with the specified name, location, resource group, and address space.
resource "azurerm_virtual_network" "vnet" {
    # Name of the Virtual Network
    name                = var.virtual_network_name
    # Location where the Virtual Network will be created
    location            = var.location
    # Resource group in which the Virtual Network will reside
    resource_group_name = var.resource_group_name
    # Address space for the Virtual Network
    address_space       = ["10.0.0.0/16"]

    # Tags for the Virtual Network
    tags = {
        # Environment tag to indicate the purpose of the Virtual Network
        environment = "dev"
    }
}

# Subnet 1 definition
# This resource creates a subnet named "subnet1" within the Virtual Network with the specified address prefix.
resource "azurerm_subnet" "subnet1" {
    # Name of the subnet
    name                 = "subnet1"
    # Resource group in which the subnet will reside
    resource_group_name  = var.resource_group_name
    # Name of the Virtual Network to which the subnet belongs
    virtual_network_name = azurerm_virtual_network.vnet.name
    # Address prefix for the subnet
    address_prefixes     = ["10.0.1.0/24"]
}

# Subnet 2 definition
# This resource creates a subnet named "subnet2" within the Virtual Network with the specified address prefix.
resource "azurerm_subnet" "subnet2" {
    # Name of the subnet
    name                 = "subnet2"
    # Resource group in which the subnet will reside
    resource_group_name  = var.resource_group_name
    # Name of the Virtual Network to which the subnet belongs
    virtual_network_name = azurerm_virtual_network.vnet.name
    # Address prefix for the subnet
    address_prefixes     = ["10.0.2.0/24"]
}

# Associate NSG to Subnet 2
# This resource associates the previously created Network Security Group (NSG) with "subnet2".
resource "azurerm_subnet_network_security_group_association" "subnet2_nsg_association" {
    # ID of the subnet to which the NSG will be associated
    subnet_id                 = azurerm_subnet.subnet2.id
    # ID of the Network Security Group to associate with the subnet
    network_security_group_id = azurerm_network_security_group.nsg.id
}


