resource "azurerm_api_management" "apim" {
    name = "example-apim-sameer"
    location = var.location
    resource_group_name = var.resource_group_name
    publisher_name = "example-publisher"
    publisher_email = "bramhechasameer@gmail.com"

    sku_name = "Developer_1"
}