data "azurerm_resource_group" "shared_resource_group" {
  name = "${var.region}${var.env}${var.project}${local.component_id}rg001"
}

data "azurerm_client_config" "current" {
}

data "terraform_remote_state" "key_vault" {
  backend = "azurerm"
  config = {
    container_name       = "tfstate"
    storage_account_name = "stem4tfdatasotfdev"
    use_azuread_auth     = true
    key                  = "${var.region}${var.env}${var.project}${local.component_id}--key_vault_shared.managed.tfstate"
    resource_group_name  = "rgem4tfdatasotfdev"
  }
}



data "azurerm_subscription" "current" {
}

data "azurerm_key_vault_secret" "appService_authorizationkey_public" {
  name         = "appService-${var.env}-authorizationkey-public"
  key_vault_id = data.terraform_remote_state.key_vault.outputs.key_vault_id
}


