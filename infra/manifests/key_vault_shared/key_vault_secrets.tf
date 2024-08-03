
resource "null_resource" "add_secrets_to_vault" {
  triggers = {
    #key_vault_id = module.kv001.id
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    interpreter = ["/bin/pwsh", "-c"]
    command     = <<-EOF
      $secrets = (az keyvault secret list --id "https://${var.master_key_vault_name}.vault.azure.net/") | convertfrom-json
      ForEach ($secret in $secrets) {
        $secretValue = ((az keyvault secret show --id $secret.id) | convertfrom-json).value
        az keyvault secret set --name $secret.name --vault-name ${module.kv001.name} --value $secretValue
      }
    EOF
  }
  depends_on = [module.kv001.id]
}
