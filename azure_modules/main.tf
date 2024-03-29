provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

# Resource Group
resource "azurerm_resource_group" "ncpl-rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

# Virtual Network
resource "azurerm_virtual_network" "ncpl-vn" {
  name                = "ncpl-vn"
  address_space       = ["10.0.0.0/8"]
  location            = azurerm_resource_group.ncpl-rg.location
  resource_group_name = azurerm_resource_group.ncpl-rg.name
}

# Subnet
resource "azurerm_subnet" "ncpl-subnet" {
  name                 = "ncpl-Subnet"
  resource_group_name  = azurerm_resource_group.ncpl-rg.name
  virtual_network_name = azurerm_virtual_network.ncpl-vn.name
  address_prefixes    = ["10.1.0.0/16"]
}