data "azurerm_resource_group" "kv_resource_group" {
  name = "rg${var.geo_id}${var.environment_id}${var.project}${var.dynamic_environment_hash}rrg001"
}

locals {
}

data "azurerm_client_config" "current" {
}