env         = "st"
region      = "uksouth"
region_code = "uks"

# Default tags
data_classification_tag = "Internal"
cost_center_tag         = "clearDemo"
role_tag                = "Demo"

# Specific to whole project
project = "cleardemo"

# App Service Settings
kind      = "Linux"
sku_size  = "B1"

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
  }
]

network_rules_ip_rules = [
  "86.0.243.202"    # AllowPete
]
