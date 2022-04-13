terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.1.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "example_resource_group"
    storage_account_name = "example_storage_account"
    container_name       = "container_terraform"
    key                  = "prod.tfstate"
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}
