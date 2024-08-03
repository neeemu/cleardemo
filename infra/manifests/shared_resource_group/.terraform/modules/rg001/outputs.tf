output "name" {
  value = azurerm_resource_group.rg001.name
}

output "app_service_default_site_hostname" {
  value = module.as001.app_service_default_site_hostname
}