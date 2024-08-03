module "rg001" {
  #source = "git::https://dev.azure.com/Specsavers/DevOpsEngineering/_git/tfmodule-azurerm_resource_group?ref=5.1.0"
  source = "C:\\Code\\cleardemo\\modules\\resource_group"

  name      = "${local.serial_prefix}"
  location  = var.region

  # tags
  default_tags = "${local.default_tags}"
  custom_tags  = {
    role = "AppService - Resource Group"
  }
}
