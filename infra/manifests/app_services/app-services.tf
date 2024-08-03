module "rg001" {
  #source = "git::https://dev.azure.com/Specsavers/DevOpsEngineering/_git/tfmodule-azurerm_resource_group?ref=5.1.0"
  source = "C:\\Code\\cleardemo\\modules\\resource_group"

  name      = "${var.region_code}${var.env}${var.project}rg001"
  location  = var.region

  # tags
  default_tags = "${local.default_tags}"
  custom_tags  = {
    role = "AppService - Resource Group"
  }
}

module "as001" {
  #source = "git::https://dev.azure.com/Specsavers/DevOpsEngineering/_git/tfmodule-azurerm_app_service?ref=7.2.0"
  source = "C:\\Code\\cleardemo\\modules\\app_service"

  asp_name            = "${local.serial_prefix}001"
  sku_tier            = var.sku_tier
  sku_size            = var.sku_size
  location            = module.rg001.location
  resource_group_name = module.rg001.name
   
  #tags
  default_tags = "${local.default_tags}"
  custom_tags  = {
    role = "AppService - nGinx"
  }

  app_services = {
    app1 = {
      name                = "${local.serial_prefix}as001"
      location            = module.rg001.location
      # tag
      default_tags = local.default_tags 
      custom_tags  = {
        "role" = "AppService - nGinx"
      }

      # azurerm_app_service
      https_only              = true
      create_app_service_plan = false
      client_cert_enabled     = false

      app_settings = {
        PORT                                = "4000"
        DOCKER_IMAGE                        = "DOCKER|nginx:stable-alpine3.19-otel"
        DOCKER_REGISTRY_SERVER_URL          = "hub.docker.com"
        WEBSITES_CONTAINER_START_TIME_LIMIT = 600
      }

      ip_restriction       = var.ip_restrictions

      site_config = {
        always_on             = true
        ftps_state            = "AllAllowed"
        http2_enabled         = true
        managed_pipeline_mode = "Integrated"
        minimum_tls_version   = "1.2"
        health_check_path     = "/health"
      }
    }
    app2 = {
      name                = "${local.serial_prefix}as002"
      location            = module.rg001.location
      # tag
      default_tags = local.default_tags 
      custom_tags  = {
        "role" = "AppService - nGinx"
      }

      # azurerm_app_service
      https_only              = true
      create_app_service_plan = false
      client_cert_enabled     = false

      app_settings = {
        PORT                                = "4000"
        DOCKER_IMAGE                        = "DOCKER|nginx:stable-alpine3.19-otel"
        DOCKER_REGISTRY_SERVER_URL          = "hub.docker.com"
        WEBSITES_CONTAINER_START_TIME_LIMIT = 600
      }

      ip_restriction       = var.ip_restrictions

      site_config = {
        always_on             = true
        ftps_state            = "AllAllowed"
        http2_enabled         = true
        managed_pipeline_mode = "Integrated"
        minimum_tls_version   = "1.2"
        health_check_path     = "/health"
      }
    }
  }
}