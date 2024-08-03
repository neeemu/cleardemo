
module "as001" {
  #source = "git::https://dev.azure.com/Specsavers/DevOpsEngineering/_git/tfmodule-azurerm_app_service?ref=7.2.0"
  source = "C:\\Code\\cleardemo\\modules\\app_service"

  asp_name            = "${local.serial_prefix}001"
  sku_tier            = var.sku_tier
  sku_size            = var.sku_size
  reserved            = true
  kind                = var.kind
  location            = data.azurerm_resource_group.shared_resource_group.location
  resource_group_name = data.azurerm_resource_group.shared_resource_group.name
   
  #tags
  default_tags = "${local.default_tags}"
  custom_tags  = {
    role = "AppService - nGinx"
  }

  app_services = {
    app1 = {
      name                = "${local.serial_prefix}as001"
      resource_group_name = data.azurerm_resource_group.shared_resource_group.name

      # tags
      default_tags = "${local.default_tags}"
      custom_tags  = {
        role = "AppService - nGinx"
      }

      # azurerm_app_service
      #app_service_plan_id     = module.asp.id
      kind                    = var.kind
      https_only              = true
      create_app_service_plan = false
      client_cert_enabled     = false

      app_settings = {
        PORT                                = "4000"
        DOCKER_IMAGE                        = "DOCKER|nginx:stable-alpine3.19-otel"
        DOCKER_REGISTRY_SERVER_URL          = "hub.docker.com"
        WEBSITES_CONTAINER_START_TIME_LIMIT = 600
      }

      site_config = {
        always_on             = true
        ftps_state            = "AllAllowed"
        http2_enabled         = true
        ip_restrictions       = var.network_rules_ip_rules
        managed_pipeline_mode = "Integrated"
        min_tls_version       = "1.2"
        linux_fx_version      = "DOCKER|nginx:stable-alpine3.19-otel"
        health_check_path     = "/health"
      }
    }
    app2 = {
      # common
      name                = "${local.serial_prefix}as002"
      resource_group_name = data.azurerm_resource_group.shared_resource_group.name

      # tags
      default_tags = "${local.default_tags}"
      custom_tags  = {
        role = "AppService - nGinx"
      }

      # azurerm_app_service
      #app_service_plan_id     = module.asp001.id
      kind                    = var.kind
      https_only              = true
      create_app_service_plan = false
      client_cert_enabled     = false

      app_settings = {
        PORT                                = "4000"
        DOCKER_IMAGE                        = "DOCKER|nginx:stable-alpine3.19-otel"
        DOCKER_REGISTRY_SERVER_URL          = "hub.docker.com"
        WEBSITES_CONTAINER_START_TIME_LIMIT = 600
      }

      site_config = {
        always_on             = true
        ftps_state            = "AllAllowed"
        http2_enabled         = true
        ip_restrictions       = var.network_rules_ip_rules
        managed_pipeline_mode = "Integrated"
        min_tls_version       = "1.2"
        linux_fx_version      = "DOCKER|nginx:stable-alpine3.19-otel"
        health_check_path     = "/health"
      }
    }
  }
}