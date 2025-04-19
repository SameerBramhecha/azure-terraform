# This Terraform configuration creates an Azure Storage Account.
# It uses the azurerm provider to manage Azure resources.
resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name # The name must be globally unique across Azure
  resource_group_name      = var.resource_group_name  # The name of the resource group in which to create the storage account
  location                 = var.location             # The Azure region where the storage account will be created
  account_tier             = "Standard"               # The performance tier of the storage account
  account_replication_type = "LRS"                    # The replication type of the storage account (Locally Redundant Storage)

  # The following settings are optional and can be customized as needed
  tags = {
    environment = "dev"
  }
}
