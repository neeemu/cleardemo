variable "name" {
  type = string
  description = "Name of the resource group"
}

variable "location" {
  type = string
  description = "location of the resource group"
}

variable "default_tags" {
  type = map(string)
  description = "List of default tags"
}

variable "custom_tags" {
  type        = map(string)
  description = "role"
}