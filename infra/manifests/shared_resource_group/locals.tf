locals {

  component_id = "rg"

  serial_prefix = "${var.region_code}${var.env}${var.project}${local.component_id}"

  # Default tags
  default_tags = {
    "data_classification" = var.data_classification_tag
    "Environment"         = var.env
    "CostCenter"          = var.cost_center_tag
    "ProjectCode"         = var.project
    "Role"                = var.role_tag
  }
}
