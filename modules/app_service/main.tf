#resource "azurerm_resource_group" "rg" {
#  name     = data.shared_resource_group.name
#  location = data.shared_resource_group.region
#}

resource "azurerm_app_service_plan" "asp" {
  name                = var.asp_name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "App"
  reserved            = var.reserved
  tags                = merge(var.default_tags, var.custom_tags)

  sku {
    tier = var.sku_tier
    size = var.sku_size
  }
}

resource "azurerm_linux_web_app" "app" {
  for_each            = var.app_services

    name                            = each.value.name
    location                        = each.value.location
    resource_group_name             = each.value.resource_group_name
    service_plan_id                 = azurerm_app_service_plan.asp.id
    tags                            = merge(var.default_tags, var.custom_tags)
    public_network_access_enabled   = false
    https_only                      = true
    client_certificate_enabled      = false

    site_config {
        always_on             = each.value.always_on
        
        ftps_state            = each.value.ftps_state
        http2_enabled         = each.value.http2_enabled
        dynamic "ip_restriction" {
            for_each = each.value.ip_address_list
                content {
                    ip_address  = cidrhost(ip_restriction.value,0)
                }
            }
        managed_pipeline_mode = each.value.managed_pipeline_mode
        minimum_tls_version   = each.value.minimum_tls_version
        linux_fx_version      = each.value.linux_fx_version
        health_check_path     = each.value.health_check_path
    }
    
    app_settings = {
        PORT                                = each.value.PORT
        DOCKER_IMAGE                        = each.value.DOCKER_IMAGE 
        DOCKER_REGISTRY_SERVER_URL          = each.value.DOCKER_REGISTRY_SERVER_URL
        WEBSITES_CONTAINER_START_TIME_LIMIT = each.value.WEBSITES_CONTAINER_START_TIME_LIMIT
    } 
}