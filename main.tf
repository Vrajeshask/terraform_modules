provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

module "modules_azure" {
  source = "D:/terraform_modules/azure_modules"
  resource_group_name        = "ncpl-rg"
  resource_group_location    = "East US"
  client_id     = "a9222413-c402-47c1-aaa1-1c59962aa118"
  client_secret = "yhh8Q~wn.H3mj.seg4kKbElrVe2oG0zwJzp7Eabd"
}

