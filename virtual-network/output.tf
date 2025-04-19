# Output the ID of the virtual network
output "virtual_network_id" {
    value = azurerm_virtual_network.vnet.id
}

# Output the ID of the first subnet
output "subnet1_id" {
    value = azurerm_subnet.subnet1.id
}

# Output the ID of the second subnet
output "subnet2_id" {
    value = azurerm_subnet.subnet2.id
}

# Output the ID of the network security group (NSG)
output "nsg_id" {
    value = azurerm_network_security_group.nsg.id
}

# Output the ID of the subnet-to-NSG association for the second subnet
output "subnet2_nsg_association_id" {
    value = azurerm_subnet_network_security_group_association.subnet2_nsg_association.id
}