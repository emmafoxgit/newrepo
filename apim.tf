resource "azurerm_resource_group" "zzexample" {
  name     = "errrexample-resources"
  location = "West Europe"
}

resource "azurerm_api_management" "example" {
  name                = "errexample-apim"
  location            = azurerm_resource_group.zzexample.location
  resource_group_name = azurerm_resource_group.zzexample.name
  publisher_name      = "My Company"
  publisher_email     = "company@terraform.io"

  sku_name = "Developer_1"
}
