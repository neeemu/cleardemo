module "rg001" {
  #source = "git::https://github.com/BesQpin/tf-resource_group-module.git"
  source = "C:\\Code\\cleardemo\\modules\\resource_group"

  name      = "${var.region_code}${var.env}${var.project}rg001"
  location  = var.region

  # tags
  default_tags = "${local.default_tags}"
  custom_tags  = {
    role = "AppService - Resource Group"
  }
}


module "str001" {
  #source = "git::https://github.com/BesQpin/tf-storage_account-module.git"
  source = "C:\\Code\\cleardemo\\modules\\storage_account"

  name                  = "${var.region_code}${var.env}${var.project}str001"
  location              = var.region
  resource_group_name   = module.rg001.name

  account_tier              = "Standard"
  account_replication_type  = "LRS"

  storage_container_name    = "${var.region_code}${var.env}${var.project}str001bkp"
  container_access_type     = "private"

  # tags
  default_tags = "${local.default_tags}"
  custom_tags  = {
    role = "AppService - Backup storage"
  }
}


module "as001" {
  #source = "git::https://github.com/BesQpin/tf-app_service-module.git"
  source = "C:\\Code\\cleardemo\\modules\\app_service"

  depends_on           = [module.rg001]

  asp_name            = "${local.serial_prefix}asp001"
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
        DOCKER_IMAGE                        = "DOCKER|BesQpin/nginx:stable-alpine3.19-otel"
        DOCKER_REGISTRY_SERVER_URL          = "hub.docker.com"
        WEBSITES_CONTAINER_START_TIME_LIMIT = 600
        DOCKER_ENABLE_CI                    = true
        #DOCKER_REGISTRY_SERVER_PASSWORD    = each.value.DOCKER_REGISTRY_SERVER_PASSWORD
        DOCKER_REGISTRY_SERVER_USERNAME     = "BesQpin"
      }

      site_config = {
        always_on             = true
        ftps_state            = "AllAllowed"
        http2_enabled         = true
        managed_pipeline_mode = "Integrated"
        minimum_tls_version   = "1.2"
        health_check_path     = "/"
        #ip_restrictions       = var.ip_restrictions
        linux_fx_version      = "DOCKER|BesQpin/nginx:stable-alpine3.19-otel"
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
        DOCKER_IMAGE                        = "DOCKER|BesQpin/nginx:stable-alpine3.19-otel"
        DOCKER_REGISTRY_SERVER_URL          = "hub.docker.com"
        WEBSITES_CONTAINER_START_TIME_LIMIT = 600
        DOCKER_ENABLE_CI                    = true
        #DOCKER_REGISTRY_SERVER_PASSWORD    = "key vault reference"
        DOCKER_REGISTRY_SERVER_USERNAME     = "BesQpin"
      }

      site_config = {
        always_on             = true
        ftps_state            = "AllAllowed"
        http2_enabled         = true
        managed_pipeline_mode = "Integrated"
        minimum_tls_version   = "1.2"
        health_check_path     = "/"
        #ip_restrictions       = var.ip_restrictions
        linux_fx_version      = "DOCKER|BesQpin/nginx:stable-alpine3.19-otel"
      }
    }
  }
}