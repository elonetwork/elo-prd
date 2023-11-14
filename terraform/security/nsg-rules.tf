# Allow inbound hhtp and https connection to nsg sub aks prod
resource "azurerm_network_security_rule" "nsr_in_web_sub_aks" {
  name                        = var.nsr_in_web_sub_aks_name
  priority                    = var.nsr_in_web_sub_aks_priority
  direction                   = var.nsr_in_web_sub_aks_direction
  access                      = var.nsr_in_web_sub_aks_access
  protocol                    = var.nsr_in_web_sub_aks_protocol
  source_port_range           = var.nsr_in_web_sub_aks_source_port_range
  destination_port_ranges     = var.nsr_in_web_sub_aks_destination_port_ranges
  source_address_prefix       =var.nsr_in_web_sub_aks_source_address_prefix
  destination_address_prefix  = var.nsr_in_web_sub_aks_destination_address_prefix
  resource_group_name         = var.resource_group_name
  network_security_group_name = module.nsg_sub_aks_prod.nsg_name
}

