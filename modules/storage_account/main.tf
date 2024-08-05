resource "azurerm_storage_account" "backup" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  tags                     = merge(var.default_tags, var.custom_tags)
}

resource "azurerm_storage_container" "backup" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.backup.name
  container_access_type = var.container_access_type
}