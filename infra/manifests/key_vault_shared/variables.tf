# Specs tags
variable "data_classification_tag" {
  type        = string
  description = "data classification"
}

variable "cost_center_tag" {
  type        = string
  description = "cost center"
}

variable "line_of_business_tag" {
  type        = string
  description = "line of business"
}

variable "project_code_tag" {
  type        = string
  description = "project code"
}

variable "role_tag" {
  type        = string
  description = "role"
}

variable "service_name_tag" {
  type        = string
  description = "service name"
}

variable "criticality_tag" {
  type        = string
  description = "criticality"
}

variable "environment_type_tag" {
  type        = string
  description = "environment type tag"
}

variable "common_tags" {
  type        = map(string)
  description = "Common Azure Tags"
  default     = {}
}

# Specsavers ids

variable "environment_id" {
  type        = string
  description = "environment id"
  default     = "d"
}

variable "geo_id" {
  type        = string
  description = "geo id based on region"
}

variable "territory_id" {
  type        = string
  description = "geo id based on region"
  default     = "r"
}

variable "project" {
  type        = string
  description = "Project name"
}

variable "region" {
  type        = string
  description = "Azure Region name"
}

variable "dynamic_environment_hash" {
  type        = string
  description = "dynamic md5 hash of the branch name"
}


variable "contributor_object_ids" {
  description = "contributor object ids used to provide access to vaults via AAD"
  type        = list(string)
  default     = []
}

variable "dynamic_environment_full" {
  type        = string
  description = "dynamic environment branch name"
}

variable "aad_admin_object_id" {
  description = "The object id of the AAD group that allows access to azure resources."
  type        = string
  default     = null
}

variable "ado_spn_object_id" {
  description = "The object id of the ADO pipeline SPN"
  type        = string
  default     = null
}

variable "master_key_vault_name" {
  description = "The name of the master key vault."
  type        = string
  default     = null
}
