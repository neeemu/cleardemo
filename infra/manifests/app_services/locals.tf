
locals {

  component_id = "asp"

  serial_prefix = "${var.region_code}${var.env}${var.project}${local.component_id}"


  ## Cloud root
  cloud_root_azure_domains = {
    em2 = ".z16.web.core.windows.net"
    em4 = ".z6.web.core.windows.net"
  }

  # Default tags
  default_tags = {
    "Environment" = var.env
    "CostCenter"  = var.cost_center_tag
    "ProjectCode" = var.project
    "Role"        = var.role_tag
  }

  # Environment Data Defaults
  apis = {
    demoAppService1  = "https://${var.region}${var.env}${var.project}${local.component_id}as001.azurewebsites.net"
    demoAppService2  = "https://${var.region}${var.env}${var.project}${local.component_id}as002.azurewebsites.net"
  }
}
