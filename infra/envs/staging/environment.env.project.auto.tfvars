env = "staging"

# App Service Settings
kind                = "Linux"
sku_tier            = "Basic"
sku_size            = "B2"
legacy_db_schema    = "soa8306"
store_id            = "8306"
dev_users_store_ids = "8306;9000" #Enables login to users without associated storeID, therefore it should NOT be set at PRODUCTION

# Database AzSql Settings
db_sku_size             = "S1"
db_zone_redundant       = false
db_size                 = "2"
aad_authentication_only = true

# API Custom Settings
metrics_enabled          = false
enactor_mock_downstream  = false
blackbox_mock_downstream = false
enactor_api_url          = "https://eem-bjssdev.apps.specsavers.com"
blackbox_api_url         = "http://scebb-dev.westeurope.cloudapp.azure.com"

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
    name       = "AllowAndrew",
  },
  {
    ip_address = "77.99.77.173/32",
    action     = "Allow",
    priority   = "101",
    name       = "AllowAnita"
  },
  {
    ip_address = "148.253.134.213/32",
    action     = "Allow",
    priority   = "102",
    name       = "AllowBJSSVPN",
  },
  {
    ip_address = "84.66.35.117/32",
    action     = "Allow",
    priority   = "103",
    name       = "AllowJoe",
  },
  {
    ip_address = "46.189.129.125/32",
    action     = "Allow",
    priority   = "104",
    name       = "AllowPauloGiron",
  },
  {
    ip_address = "93.108.57.165/32",
    action     = "Allow",
    priority   = "105",
    name       = "AllowPauloRodrigues",
  },
  {
    ip_address = "93.108.208.73/32",
    action     = "Allow",
    priority   = "106",
    name       = "AllowPedro",
  },
  {
    ip_address = "51.105.222.194/32",
    action     = "Allow",
    priority   = "107",
    name       = "AllowSpecsaversVM",
  },
  {
    ip_address = "31.111.75.223/32",
    action     = "Allow",
    priority   = "108",
    name       = "AllowJonBoam",
  },
  {
    ip_address = "148.64.8.0/24",
    action     = "Allow",
    priority   = "109",
    name       = "AllowSpecsaversOffice",
  },
  {
    ip_address = "144.64.204.65/32",
    action     = "Allow",
    priority   = "110",
    name       = "AllowFlavio",
  },
  {
    ip_address = "90.242.146.96/32",
    action     = "Allow",
    priority   = "111",
    name       = "AllowMatt",
  },
  {
    ip_address = "80.44.83.49/32",
    action     = "Allow",
    priority   = "112",
    name       = "AllowJonny",
  },
  {
    ip_address = "86.191.216.79/32",
    action     = "Allow",
    priority   = "113",
    name       = "AllowIan",
  },
  {
    ip_address = "86.3.39.29/32",
    action     = "Allow",
    priority   = "114",
    name       = "AllowMadjid",
  },
  {
    ip_address = "86.16.168.62/32",
    action     = "Allow",
    priority   = "115",
    name       = "AllowBenjamin",
  },
  {
    virtual_network_subnet_id = "/subscriptions/af98d3de-ba85-450c-abfc-398c3866e657/resourceGroups/rgem4devsocuknet/providers/Microsoft.Network/virtualNetworks/vnetem4devsocuk/subnets/DaasSOCDEV",
    action                    = "Allow",
    priority                  = "116",
    name                      = "AllowSubNetWVD"
  },
  {
    ip_address = "85.245.154.141/32",
    action     = "Allow",
    priority   = "117",
    name       = "AllowPauloLeite",
  },
  {
    ip_address = "51.219.68.90/32",
    action     = "Allow",
    priority   = "118",
    name       = "AllowSouthamptionClients",
  },
  {
    ip_address = "80.229.103.40/32",
    action     = "Allow",
    priority   = "119",
    name       = "AllowSouthamptionPublic",
  },
  {
    ip_address = "52.214.130.196/32",
    action     = "Allow",
    priority   = "120",
    name       = "AllowPlanIT",
  },
  {
    ip_address = "37.203.43.180/32",
    action     = "Allow",
    priority   = "121",
    name       = "AllowExperitest",
  }
]

network_rules_ip_rules = [
  "86.0.243.202",    # AllowAndrew
  "77.99.77.173",    # AllowAnita
  "148.253.134.213", # AllowBJSSVPN
  "84.66.35.117",    # AllowJoe
  "46.189.129.125",  # AllowPauloGiron
  "93.108.57.165",   # AllowPauloRodrigues
  "93.108.208.73",   # AllowPedro
  "51.105.222.194",  # AllowSpecsaversVM
  "31.111.75.223",   # AllowJonBoam
  "144.64.204.65",   # AllowFlavio
  "90.242.146.96",   # AllowMatt
  "80.44.83.49",     # AllowJonny
  "86.191.216.79",   # AllowIan
  "148.64.8.0/24",   # AllowSpecsaversOffice
  "86.3.39.29",      # AllowMadjid
  "86.16.168.62",    # AllowBenjamin
  "85.245.154.141",  # AllowPauloLeite
  "51.105.222.194",  # WVD
  "52.149.78.112",   # WVD
  "51.219.68.90",    # Southamption-Clients
  "80.229.103.40",   # Southamption-Public
  "52.214.130.196",  # PlanIT
  "37.203.43.180",   # Experitest
]



sql_firewall_rules = {
  "AllowAndrew" : {
    start_ip_address = "86.0.243.202"
    end_ip_address   = "86.0.243.202"
  },
  "AllowAnita" : {
    start_ip_address = "77.99.77.173"
    end_ip_address   = "77.99.77.173"
  },
  "AllowBJSSVPN" : {
    start_ip_address = "148.253.134.213"
    end_ip_address   = "148.253.134.213"
  },
  "AllowJoe" : {
    start_ip_address = "84.66.35.117"
    end_ip_address   = "84.66.35.117"
  },
  "AllowPauloGiron" : {
    start_ip_address = "46.189.129.125"
    end_ip_address   = "46.189.129.125"
  },
  "AllowPauloRodrigues" : {
    start_ip_address = "93.108.57.165"
    end_ip_address   = "93.108.57.165"
  },
  "AllowPedro" : {
    start_ip_address = "93.108.208.73"
    end_ip_address   = "93.108.208.73"
  },
  "AllowSpecsaversVM" : {
    start_ip_address = "51.105.222.194"
    end_ip_address   = "51.105.222.194"
  },
  "AllowJonBoam" : {
    start_ip_address = "146.90.132.86"
    end_ip_address   = "146.90.132.86"
  },
  "AllowFlavio" : {
    start_ip_address = "144.64.204.65"
    end_ip_address   = "144.64.204.65"
  },
  "AllowMatt" : {
    start_ip_address = "90.242.146.96"
    end_ip_address   = "90.242.146.96"
  },
  "AllowJonny" : {
    start_ip_address = "80.44.83.49"
    end_ip_address   = "80.44.83.49"
  },
  "AllowIan" : {
    start_ip_address = "86.191.216.79"
    end_ip_address   = "86.191.216.79"
  },
  "AllowMadjid" : {
    start_ip_address = "86.3.39.29"
    end_ip_address   = "86.3.39.29"
  },
  "AllowBenjamin" : {
    start_ip_address = "86.16.168.62"
    end_ip_address   = "86.16.168.62"
  },
  "AllowSpecsaversOffice" : {
    start_ip_address = "148.64.8.0"
    end_ip_address   = "148.64.8.254"
  },
  "AllowPauloLeite" : {
    start_ip_address = "85.245.154.141"
    end_ip_address   = "85.245.154.141"
  },
  "AllowPlanIT" : {
    start_ip_address = "52.214.130.196"
    end_ip_address   = "52.214.130.196"
  },
  "AllowExperitest" : {
    start_ip_address = "37.203.43.180"
    end_ip_address   = "37.203.43.180"
  }
}

wvd_subnet_ids = ["/subscriptions/af98d3de-ba85-450c-abfc-398c3866e657/resourceGroups/rgem4devsocuknet/providers/Microsoft.Network/virtualNetworks/vnetem4devsocuk/subnets/DaasSOCDEV"]
store_info_url = "https://qa-ie-mjd-socrates-cloudtest.az.ssdgws.co.uk"
rum_url        = "https://rum-ingest.eu0.signalfx.com/v1/rum"

# AAD Resource Access Group
aad_admin_username        = "ARA GBL PRE SocCloud Resource Access"
aad_resource_access_group = "ARA GBL PRE SocCloud Resource Access"
aad_admin_object_id       = "1a54a281-4532-4f38-a463-504b73fd1627"

master_key_vault_name = "kvem4qsotfmaster001"
