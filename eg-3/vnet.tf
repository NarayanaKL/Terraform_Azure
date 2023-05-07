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
  location = var.region
}

resource "azurerm_virtual_network" "hitechvnet" {
  name                = "hitechvnet"
  location            = azurerm_resource_group.hitechrg.location
  resource_group_name = azurerm_resource_group.hitechrg.name
  address_space       = [var.vnet_cidr]

  subnet {
    name           = "subnet1"
    address_prefix = var.sub01_cidr
  }

  subnet {
    name           = "subnet2"
    address_prefix = var.sub02_cidr
  }

}
