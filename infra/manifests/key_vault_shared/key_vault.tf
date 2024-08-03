resource "random_id" "kvsuffix" {
  byte_length = 1
}

module "kv001" {
  # count  = var.dynamic_environment_hash == "luc" ? 0 : 1
  source = "git::https://dev.azure.com/Specsavers/DevOpsEngineering/_git/tfmodule-azurerm_key_vault?ref=5.5.1"

  # common
  geo_id              = var.geo_id
  environment_id      = var.environment_id
  service_name        = var.project
  serial_number       = var.dynamic_environment_hash == "luc" ? "${local.serial_prefix}001" : "${local.serial_prefix}${random_id.kvsuffix.dec}001"
  resource_group_name = data.azurerm_resource_group.kv_resource_group.name
  location            = var.region

  # tags
  criticality_tag         = var.criticality_tag
  environment_type_tag    = var.environment_type_tag
  data_classification_tag = var.data_classification_tag
  cost_center_tag         = var.cost_center_tag
  line_of_business_tag    = var.line_of_business_tag
  project_code_tag        = var.project_code_tag
  service_name_tag        = var.service_name_tag
  role_tag                = "Key Vault"
  custom_tags             = local.custom_tags

  sku_name                        = "standard"
  enabled_for_deployment          = true
  enabled_for_disk_encryption     = true
  enabled_for_template_deployment = true
  soft_delete_retention_days      = 7
  contributor_object_ids          = var.contributor_object_ids
  enable_rbac_authorization       = true

}

resource "azurerm_role_assignment" "kv_reader_role_assignment" {
  scope                = module.kv001.id
  role_definition_name = "Key Vault Reader"
  principal_id         = var.aad_admin_object_id
  depends_on           = [module.kv001]
}

resource "azurerm_role_assignment" "kv_secret_user_role_assignment" {
  scope                = module.kv001.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = var.aad_admin_object_id
  depends_on           = [module.kv001]
}

resource "azurerm_role_assignment" "pipeline_kv_role_assignment" {
  scope                = module.kv001.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = var.ado_spn_object_id
  depends_on           = [module.kv001]
}