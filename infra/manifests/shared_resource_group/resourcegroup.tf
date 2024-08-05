module "rg001" {
  #source = "git::https://github.com/BesQpin/tf-resource_group-module.git"
  source = "C:\\Code\\cleardemo\\modules\\resource_group"

  name      = "${local.serial_prefix}001"
  location  = var.region

  # tags
  default_tags = "${local.default_tags}"
  custom_tags  = {
    role = "AppService - Resource Group"
  }
}
