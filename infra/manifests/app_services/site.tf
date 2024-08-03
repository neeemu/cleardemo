terraform {
  backend "azurerm" {
    resource_group_name   = "piw-platform-rg"
    storage_account_name  = "piwtfstatestr"
    container_name        = "tfstate"
    key                   = "terraform.tfstate.appservice"
    use_azuread_auth      = true
  }
  required_version = ">= 1.9.3"
  required_providers {
    azurerm = {
      version = "= 3.85.0"
    }
  }
}

provider "azurerm" {
  features {}
}