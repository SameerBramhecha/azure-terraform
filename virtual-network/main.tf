# Network Security Group (NSG) definition
# This resource creates a Network Security Group named "nsg-vnet" in the specified location and resource group.
resource "azurerm_network_security_group" "nsg" {
    name                = "nsg-vnet"
    location            = var.location
    resource_group_name = var.resource_group_name
}

# Virtual Network definition
# This resource creates a Virtual Network with the specified name, location, resource group, and address space.
resource "azurerm_virtual_network" "vnet" {
    name                = var.virtual_network_name
    location            = var.location
    resource_group_name = var.resource_group_name
    address_space       = ["10.0.0.0/16"]

    # Tags for the Virtual Network
    tags = {
        environment = "dev"
    }
}

# Subnet 1 definition
# This resource creates a subnet named "subnet1" within the Virtual Network with the specified address prefix.
resource "azurerm_subnet" "subnet1" {
    name                 = "subnet1"
    resource_group_name  = var.resource_group_name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes     = ["10.0.1.0/24"]
}

# Subnet 2 definition
# This resource creates a subnet named "subnet2" within the Virtual Network with the specified address prefix.
resource "azurerm_subnet" "subnet2" {
    name                 = "subnet2"
    resource_group_name  = var.resource_group_name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes     = ["10.0.2.0/24"]
}

# Associate NSG to Subnet 2
# This resource associates the previously created Network Security Group (NSG) with "subnet2".
resource "azurerm_subnet_network_security_group_association" "subnet2_nsg_association" {
    subnet_id                 = azurerm_subnet.subnet2.id
    network_security_group_id = azurerm_network_security_group.nsg.id
}
