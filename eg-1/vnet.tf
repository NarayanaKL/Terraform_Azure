# Azure Provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Start creating azure resources
resource "azurerm_resource_group" "hitechrg" {
  name     = "terraform-resources"
  location = "Central India"
}

resource "azurerm_virtual_network" "hitechvnet" {
  name                = "hitechvnet"
  location            = azurerm_resource_group.hitechrg.location
  resource_group_name = azurerm_resource_group.hitechrg.name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  tags = {
    environment = "Production"
  }
}
