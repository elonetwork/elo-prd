include "config" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../terraform//infrastructure"
}

inputs = {
  vnet_prod_name = "vnet-prod"
  vnet_prod_address_space = "10.102.0.0/16"
  sub_aks_prod_address_prefixes =  "10.102.0.0/18"
  sub_aks_prod_address_name =  "sub-aks-prod"
  sub_appgtw_prd_address_prefixes = "10.102.128.0/17"
  sub_appgtw_prd_name = "sub_appgtw_prd"
  sub_aks_agents_address_prefixes =  "10.102.64.0/18"
  sub_aks_agents_name =  "sub-aks-agents"

  username = "saijiro"
  password = "Password@123"

  acr_name  =  "elonetworkcontainerRegistry"
  acr_sku = "Standard"
  acr_admin_enabled = false

  application_gateway_name = "app-gtw-prd"
  application_gateway_sku_name = "WAF_v2"
  application_gateway_sku_tier = "WAF_v2"
  application_gateway_sku_capacity = 2
  application_gateway_waf_configuration_enabled = true
  application_gateway_waf_configuration_firewall_mode = "Detection"
  application_gateway_waf_configuration_rule_set_version = "3.2"
  application_gateway_ip_configuration_name      = "my-gateway-ip-configuration" 
  application_gateway_frontend_port_port     = 80 
}