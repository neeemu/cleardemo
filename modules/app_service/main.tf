resource "azurerm_service_plan" "asp" {

  name                = var.asp_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = merge(var.default_tags, var.custom_tags)
  sku_name = var.sku_size
  os_type = "Linux"
}

resource "azurerm_linux_web_app" "app" {

  for_each            = var.app_services

    name                            = each.value.name
    location                        = each.value.location
    resource_group_name             = azurerm_service_plan.asp.resource_group_name
    service_plan_id                 = azurerm_service_plan.asp.id
    tags                            = merge(var.default_tags, var.custom_tags)
    https_only                      = true
    client_certificate_enabled      = false

    site_config {

        always_on             = each.value.site_config.always_on
        ftps_state            = each.value.site_config.ftps_state
        http2_enabled         = each.value.site_config.http2_enabled
        
        ip_restriction {

            name       = "DenyAllOthers"
            ip_address = "0.0.0.0/0"
            action     = "Deny"
            priority   = 200
        }
        ip_restriction{

            service_tag = "AzureCloud"
            action      = "Allow"
            priority    = "99"
            name        = "AllowAzureCloud"
        }
        ip_restriction{

            ip_address = "86.0.243.202/32"
            action     = "Allow"
            priority   = "100"
            name       = "AllowPete"
        }

        managed_pipeline_mode = each.value.site_config.managed_pipeline_mode
        minimum_tls_version   = each.value.site_config.minimum_tls_version
        health_check_path     = each.value.site_config.health_check_path
    }
    
    app_settings = {
        PORT                                = each.value.app_settings.PORT
        DOCKER_IMAGE                        = each.value.app_settings.DOCKER_IMAGE 
        DOCKER_REGISTRY_SERVER_URL          = each.value.app_settings.DOCKER_REGISTRY_SERVER_URL
        WEBSITES_CONTAINER_START_TIME_LIMIT = each.value.app_settings.WEBSITES_CONTAINER_START_TIME_LIMIT
    } 
}

resource "azurerm_web_app_backup_configuration" "backup" {
  name                = var.app_service_name
  resource_group_name = azurerm_resource_group.rg.name
  web_app_name        = azurerm_app_service.app.name

  storage_account_url = azurerm_storage_account.backup.primary_blob_endpoint
  storage_account_key = azurerm_storage_account.backup.primary_access_key

  schedule {
    frequency_interval = 1
    frequency_unit     = "Day"
    keep_at_least_one_backup = true
    retention_period_in_days = 30
  }
}