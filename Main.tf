terraform {
  required_version = ">= 1.1.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  #
  cloud {
    organization = "emmafoxorg"
    workspaces {
      name = "emmapi"
    }
  }
}

provider "azurerm" {
  features {}
}


# Create a resource group
resource "azurerm_resource_group" "example11" {
  name     = "zzerexample-resources"
  location = "West Europe"
}



resource "azurerm_resource_group" "example" {
  name     = "azure-functions-test-rg"
  location = "West Europe"
}

#resource "azurerm_storage_account" "example" {
 # name                     = "zzafunctionsapptestsa"
#  resource_group_name      = azurerm_resource_group.example.name
#  location                 = azurerm_resource_group.example.location
#  account_tier             = "Standard"
#  account_replication_type = "LRS"
#}

#resource "azurerm_app_service_plan" "example" {
#  name                = "azure-functions-test-service-plan"
#  location            = azurerm_resource_group.example.location
#  resource_group_name = azurerm_resource_group.example.name

#  sku {
#    tier = "Standard"
#    size = "S1"
#  }
#}

#resource "azurerm_function_app" "example" {
#  name                       = "zzterest-azure-functions"
 # location                   = azurerm_resource_group.example.location
 # resource_group_name        = azurerm_resource_group.example.name
 # app_service_plan_id        = azurerm_app_service_plan.example.id
 # storage_account_name       = azurerm_storage_account.example.name
 # storage_account_access_key = azurerm_storage_account.example.primary_access_key
#}



resource "azurerm_resource_group" "zzzexample" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_network_security_group" "zzzexample" {
  name                = "example-security-group"
  location            = azurerm_resource_group.zzzexample.location
  resource_group_name = azurerm_resource_group.zzzexample.name
}

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.example.id
  }

  tags = {
    environment = "Production"
  }
}
