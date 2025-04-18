# Define a resource for an Azure Public IP
resource "azurerm_public_ip" "public_ip" {
    # Name of the public IP resource
    name                = "myPublicIP"
    
    # Location where the resource will be created
    location            = var.location
    
    # Name of the resource group where the public IP will reside
    resource_group_name = var.resource_group_name
    
    # Allocation method for the public IP (Static or Dynamic)
    allocation_method   = "Static"

    # SKU (Stock Keeping Unit) for the public IP
    sku      = "Basic" # Basic SKU is used
    sku_tier = "Regional" # Regional tier is specified

    # Tags to categorize the resource
    tags = {
        environment = "dev" # Indicates this is for the development environment
    }
}
