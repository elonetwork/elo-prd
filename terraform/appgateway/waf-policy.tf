resource "azurerm_web_application_firewall_policy" "waf_policy_prod" {
  name                = "elo-wafpolicy"
  resource_group_name = var.resource_group_name
  location            = var.location

  managed_rules {
    managed_rule_set {
      version = "3.2"
    }
  }
}