# Allow inbound hhtp and https connection to nsg sub aks prod
resource "azurerm_network_security_rule" "nsr_in_web_sub_aks" {
  name                        = "nsr_in_web_sub_aks"
  priority                    = 111
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["80", "443", "53"]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = module.nsg_sub_aks_prod.nsg_name
}
# Allow inbound hhtp and https connection to nsg sub appgtw prod
resource "azurerm_network_security_rule" "nsr_in_web_sub_appgtw" {
  name                        = "nsr_in_web_sub_appgtw"
  priority                    = 111
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["80", "443", "53"]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = module.nsg_sub_appgtw_prod.nsg_name
}

