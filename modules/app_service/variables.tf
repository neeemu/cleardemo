variable "app_services" {
  type        = map(string)
  description = "app services config to deploy"
  default     = {}
}

variable "asp_name" {
  description = "name of the app service plan"
  type = string
}

variable "default_tags" {
  type = map(string)
  description = "List of default tags"
}

variable "network_rules_ip_rules" {
  description = "List of public IP or IP ranges in CIDR Format. Only IPV4 addresses are allowed. Private IP address ranges (as defined in RFC 1918) are not allowed. Defaults to null"
  type        = list(string)
  default     = []
}

variable "location" {
  description = "The azure region to deploy the resource to"
  type        = string
}

variable "kind" {
  description = "The kind of the App Service Plan to create. Possible values are Windows (also available as App), Linux, elastic (for Premium Consumption) and FunctionApp (for a Consumption Plan). Defaults to Windows. Changing this forces a new resource to be created."
  type        = string
}

variable "sku_tier" {
  description = "Specifies the sky tier of SKU for the App Service Plan. Changing this forces a new resource to be created."
  type        = string
}

variable "sku_size" {
  description = "Specifies the sku size. Changing this forces a new resource to be created."
  type        = string
}

variable "app_svc_instance_count" {
  description = "Specifies the instance count of the app service."
  type        = number
  default     = null
}

variable "app_svc_zone_redundant" {
  description = "Specifies whether the app service plan should be zone redundant using availabilty zones. Requires a minimum of 3 instances."
  type        = bool
  default     = null
}

variable "custom_tags" {
  type        = map(string)
  description = "custom tags"
}


variable "ado_token" {
  type        = string
  description = "The ado token from the pipeline to login to AzDO"
  default     = "No token provided" # Help understand what went wrong
}

variable "ip_restrictions" {
  description = "IPs restrictions list map for App Service. See documentation https://www.terraform.io/docs/providers/azurerm/r/app_service.html#ip_restriction"
  type        = list(map(string))
  default     = []
}

variable "reserved" {
  type        = bool
  description = "reserved plan type"
}

variable "resource_group_name" {
  type = string
  description = "Name of the resource group"
}
