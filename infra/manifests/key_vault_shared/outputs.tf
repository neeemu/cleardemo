output "key_vault_id" {
  description = "The resource id of the key vault"
  value       = module.kv001.id

}

output "key_vault_name" {
  description = "The name of the key vault"
  value       = module.kv001.name

}
