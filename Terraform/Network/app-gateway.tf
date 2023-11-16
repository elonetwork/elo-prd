/* resource "azurerm_public_ip" "public-ip-app-gateway" {
  name                = var.public-ip-app-gateway
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = var.allocation_method
}

resource "azurerm_application_gateway" "app-gateway" {
  name                = var.name-app-gateway
  resource_group_name = var.resource_group_name
  location            = var.location

  sku {
    name     = var.sku-name
    tier     = var.sku-tier
    capacity = var.capacity
  }
  waf_configuration {
    enabled          = "true"
    firewall_mode    = "Detection"
    rule_set_type    = "OWASP"
    rule_set_version = "3.0"
  }

  gateway_ip_configuration {
    name      = var.name-gateway-ip-configuration
    subnet_id = var.subnet-id-gateway
  }

  frontend_port {
    name = var.name-frontend-port-gateway
    port = var.frontend-port-gateway
  }

  frontend_ip_configuration {
    name                 = var.name-frontend-ip-configuration
    public_ip_address_id = azurerm_public_ip.public-ip-app-gateway.id
  }

  frontend_ip_configuration {
    name                 = "app-gtw-private"
    subnet_id = var.subnet-id-gateway
    private_ip_address_allocation = "Static"
    private_ip_address = "10.200.0.10"
  }

  backend_address_pool {
    name = var.name-backend-address-pool
  }

  backend_http_settings {
    name                  = var.name-backend-http-settings
    cookie_based_affinity = var.cookie-based-affinity
    path                  = var.backend-http-settings-path
    port                  = var.port-backend-http-settings
    protocol              = var.protocol-backend-http-settings
    request_timeout       = var.request-timeout-backend-http-settings
  }

  http_listener {
    name                           = var.name-http-listener
    frontend_ip_configuration_name = var.name-frontend-ip-configuration
    frontend_port_name             = var.name-frontend-port-gateway
    protocol                       = var.protocol-backend-http-settings
  }

  request_routing_rule {
    name                       = var.name-request-routing-rule
    rule_type                  = var.rule-type
    http_listener_name         = var.name-http-listener
     backend_address_pool_name = var.name-backend-address-pool
     priority=var.priority
     backend_http_settings_name = var.name-backend-http-settings
  }
} */

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

  custom_rules {
    name      = "Rule1"
    priority  = 1
    rule_type = "MatchRule"

    match_conditions {
      match_variables {
        variable_name = "RemoteAddr"
      }

      operator           = "IPMatch"
      negation_condition = false
      match_values       = ["192.168.1.0/24", "10.0.0.0/24"]
    }

    action = "Block"
  }

  custom_rules {
    name      = "Rule2"
    priority  = 2
    rule_type = "MatchRule"

    match_conditions {
      match_variables {
        variable_name = "RemoteAddr"
      }

      operator           = "IPMatch"
      negation_condition = false
      match_values       = ["192.168.1.0/24"]
    }

    match_conditions {
      match_variables {
        variable_name = "RequestHeaders"
        selector      = "UserAgent"
      }

      operator           = "Contains"
      negation_condition = false
      match_values       = ["Windows"]
    }

    action = "Block"
  }

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

resource "azurerm_application_gateway" "network" {
  depends_on                        = [azurerm_web_application_firewall_policy.example]
  name                              = var.name-app-gateway
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
    subnet_id = var.subnet-id-gateway
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