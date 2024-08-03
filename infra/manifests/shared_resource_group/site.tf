terraform {
  backend "azurerm" {
    resource_group_name   = "piw-platform-rg"
    storage_account_name  = "piwtfstatestr"
    container_name        = "tfstate"
    key                   = "terraform.tfstate.rg"
    use_azuread_auth      = true
  }
  required_version = ">= 1.0.6"
  required_providers {
    azurerm = {
      version = "~> 2.89.0"
    }
  }
}

provider "azurerm" {
  features {}
}