include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../terraform//gateway"
}

dependencies{
  paths = ["../infrastructure"]
}

dependency "infrastructure" {
  config_path  = "../infrastructure"
}


inputs = {
  sub_appgtw_prd_id = dependency.infrastructure.outputs.sub_appgtw_prd_id
  vnet_name = dependency.infrastructure.outputs.vnet_prod_name
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
