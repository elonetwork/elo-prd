// Application gateway

resource "azurerm_public_ip" "appgatw_public_ip" {
  name                = var.appgatw_public_ip
  resource_group_name = var.resource_group_name
  location            = var.location
  # allocation_method   = "Dynamic"
  allocation_method   = "Static"
  sku = "Standard"
}

# since these variables are re-used - a locals block makes this more maintainable
locals {
  backend_address_pool_name      = "${var.vnet_prod_name}-beap"
  frontend_port_name             = "${var.vnet_prod_name}-feport"
  frontend_ip_configuration_name = "${var.vnet_prod_name}-feip"
  http_setting_name              = "${var.vnet_prod_name}-be-htst"
  listener_name                  = "${var.vnet_prod_name}-httplstn"
  request_routing_rule_name      = "${var.vnet_prod_name}-rqrt"
  redirect_configuration_name    = "${var.vnet_prod_name}-rdrcfg"
}

resource "azurerm_application_gateway" "appgatwprd" {
  name                = var.appgatwprd
  resource_group_name = var.resource_group_name
  location            = var.location
  firewall_policy_id= azurerm_web_application_firewall_policy.waf_policy_prod.id
  sku {
    name     = "WAF_v2"
    tier     = "WAF_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "gateway-ip-configuration"
    subnet_id = var.sub_appgatw_prod_id 
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.appgatw_public_ip.id
  }

  backend_address_pool {
    name = local.backend_address_pool_name
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    path                  = "/path1/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
  }
}



