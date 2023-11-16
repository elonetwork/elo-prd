locals {
  backend_address_pool_name      = "test-beap"
  frontend_port_name             = "test-feport"
  frontend_ip_configuration_name = "test-feip"
  http_setting_name              = "test-be-htst"
  listener_name                  = "test-httplstn"
  request_routing_rule_name      = "test-rqrt"
  redirect_configuration_name    = "test-rdrcfg"
}

resource "azurerm_public_ip" "example" {
  name                = "example-pip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_web_application_firewall_policy" "example" {
  name                = "example-wafpolicy"
  resource_group_name = var.resource_group_name
  location            = var.location

  managed_rules {
    managed_rule_set {
      type    = "OWASP"
      version = "3.2"
      rule_group_override {
        rule_group_name = "REQUEST-920-PROTOCOL-ENFORCEMENT"
        rule {
          id      = "920300"
          enabled = true
          action  = "Log"
        }
        rule {
          id      = "920440"
          enabled = true
          action  = "Block"
        }
      }
    }
  }
}

resource "azurerm_application_gateway" "network" {
  depends_on                        = [azurerm_web_application_firewall_policy.example]
  name                              = var.application_gateway_name
  resource_group_name               = var.resource_group_name
  location                          = var.location
  firewall_policy_id                = azurerm_web_application_firewall_policy.example.id
  force_firewall_policy_association = true

  sku {
    name     = "WAF_v2"
    tier     = "WAF_v2"
    capacity = 2
  }

  waf_configuration {
    enabled          = true
    firewall_mode    = "Detection"
    rule_set_version = "3.2"
  }

  gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = var.sub_appgtw_prd_id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.example.id
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
