env     = "qa"
region  = "uksouth"

# Default tags
data_classification_tag = "Internal"
cost_center_tag         = "clearDemo"
role_tag                = "Demo"

# Feed settings
AzDO_URL = "https://dev.azure.com/"

# Specific to whole project
project = "clearDemo"

# App Service Settings
kind      = "Linux"
sku_tier  = "Basic"
sku_size  = "B2"
reserved  = true


# App Registration Settings
azure_ad_tenant_id = "cfd94e65-c6bc-4fa7-bbd0-c0f9ffcda1b4" # Socrates Cloud (DEV)

ip_restrictions = [
  {
    service_tag = "AzureCloud",
    action      = "Allow",
    tag         = "ServiceTag",
    priority    = "99",
    name        = "AllowAzureCloud"
  },
  {
    ip_address = "86.0.243.202/32",
    action     = "Allow",
    priority   = "100",
    name       = "AllowPete",
  },
  {
    virtual_network_subnet_id = "/subscriptions/af98d3de-ba85-450c-abfc-398c3866e657/resourceGroups/rgem4devsocuknet/providers/Microsoft.Network/virtualNetworks/vnetem4devsocuk/subnets/DaasSOCDEV",
    action                    = "Allow",
    priority                  = "116",
    name                      = "AllowSubNetWVD"
  }
]

network_rules_ip_rules = [
  "86.0.243.202"    # AllowPete
]


# AAD Resource Access Group
#aad_admin_username        = "ARA GBL PRE SocCloud Resource Access"
#aad_resource_access_group = "ARA GBL PRE SocCloud Resource Access"
#aad_admin_object_id       = "1a54a281-4532-4f38-a463-504b73fd1627"

#ado_spn_object_id = "bb12bca3-539b-4df0-a735-e1b9a1176069"

#master_key_vault_name = "kvem4qsotfmaster001"
