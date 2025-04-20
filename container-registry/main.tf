# Define a resource for an Azure Container Registry
resource "azurerm_container_registry" "container_registry" {
    # Name of the container registry
    name                = "containerregistrysameer"
    
    # Name of the resource group where the container registry will be created
    resource_group_name = var.resource_group_name
    
    # Location of the resource group
    location            = var.location
    
    # SKU (pricing tier) for the container registry. Options: Basic, Standard, Premium
    sku                 = "Basic"
    
    # Enable admin user for the container registry (use with caution for security reasons)
    admin_enabled       = true

    # Uncomment the following block to enable geo-replication for the container registry
    # Georeplication is suuported only in Premium SKU
    # georeplications {
    #     # Location for geo-replication
    #     location = "West India"
    #     
    #     # Enable zone redundancy for geo-replication
    #     zone_redundancy_enabled = true
    # }

    # Tags to categorize resources for management and billing purposes
    tags = {
        environment = "dev"       # Environment tag (e.g., dev, staging, prod)
        project     = "myproject" # Project name tag
    }
}