# This file contains the configuration for creating an Azure Resource Group.
# It uses the azurerm provider to manage Azure resources.
resource "azurerm_resource_group" "rg" {
    name     = var.resource_group_name # The name of the resource group to be created
    location = var.resource_group_location # The Azure region where the resource group will be created
}