locals {

  component_id = "kv"

  serial_prefix = "${var.dynamic_environment_hash}${var.territory_id}${local.component_id}"

  tenant_id = data.azurerm_client_config.current.tenant_id

  # Default tags
  custom_tags = merge({
    DynamicEnv        = var.dynamic_environment_full
    MaintenanceWindow = ""
    ExpirationDate    = ""
  }, var.common_tags)

  default_tags = {
    "Criticality"        = var.criticality_tag
    "EnvironmentType"    = var.environment_type_tag
    "DataClassification" = var.data_classification_tag
    "CostCenter"         = var.cost_center_tag
    "LineOfBusiness"     = var.line_of_business_tag
    "ProjectCode"        = var.project_code_tag
    "Role"               = var.role_tag
    "ServiceName"        = var.service_name_tag
  }

}
