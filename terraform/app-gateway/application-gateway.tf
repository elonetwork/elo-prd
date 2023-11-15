resource "azurerm_web_application_firewall_policy" "app_gateway_firewall_policy" {
  name                = "example-wafpolicy"
  resource_group_name = var.resource_group_name
  location            = var.location 

  policy_settings {
    enabled                     = true
    mode                        = "Prevention"
    request_body_check          = true
    file_upload_limit_in_mb     = 100
    max_request_body_size_in_kb = 128
  }

  managed_rules {
    exclusion {
      match_variable          = "RequestHeaderNames"
      selector                = "x-company-secret-header"
      selector_match_operator = "Equals"
    }
    exclusion {
      match_variable          = "RequestCookieNames"
      selector                = "too-tasty"
      selector_match_operator = "EndsWith"
    }

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




resource "azurerm_application_gateway" "app_gateway" {
  name                = format("%s_app_gateway", var.env_name)
  resource_group_name = var.resource_group_name
  location            = var.location
  firewall_policy_id                = azurerm_web_application_firewall_policy.app_gateway_firewall_policy.id
  force_firewall_policy_association = true

  sku {
    name     = "WAF_v2"
    tier     = "WAF_v2"
    capacity = 2
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    path                  = "/path1/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  gateway_ip_configuration {
    name      = "example-configuration"
    subnet_id = var.app_gateway_subnet_id
  }

  frontend_port {
    name = local.frontend_port_name
    port = var.frontend_port
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.app_gateway_public_ip.id
  }

  backend_address_pool {
    name = local.backend_address_pool_name
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

