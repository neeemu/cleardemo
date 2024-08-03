variable "kind" {
  description = "The kind of the App Service Plan to create. Possible values are Windows (also available as App), Linux, elastic (for Premium Consumption) and FunctionApp (for a Consumption Plan). Defaults to Windows. Changing this forces a new resource to be created."
  type        = string
}

variable "project" {
  type        = string
  description = "The project"
}

variable "region" {
  type        = string
  description = "The Azure Region"
}

variable "region_code" {
  type        = string
  description = "The short Azure Region code"
}

variable "env" {
  type        = string
  description = "The environment acronym"
}

variable "cost_center_tag" {
  type        = string
  description = "cost center"
}

variable "data_classification_tag" {
  type = string
  description = "Data classification"
}

variable "role_tag" {
  type        = string
  description = "role"
}

variable "common_tags" {
  type        = map(string)
  description = "Common Azure Tags"
  default     = {}
}




