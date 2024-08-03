locals {

  component_id = "demo"

  serial_prefix = "${var.region}${var.env}${var.project}${local.component_id}"

  # Default tags
  default_tags = {
    "Environment" = var.env
    "CostCenter"  = var.cost_center_tag
    "ProjectCode" = var.project
    "Role"        = var.role_tag
  }
}
