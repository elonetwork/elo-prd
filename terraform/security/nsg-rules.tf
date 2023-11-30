# Allow inbound hhtp and https connection to nsg sub aks prod
resource "azurerm_network_security_rule" "nsr" {
  for_each = var.nsg_rules_aks

  name                = each.value.nsr_name
  priority           = each.value.nsr_priority
  direction           = each.value.nsr_direction
  access              = each.value.nsr_access
  protocol            = each.value.nsr_protocol
  source_port_range    = each.value.nsr_source_port_range
  destination_port_ranges = each.value.nsr_destination_port_ranges
  destination_port_range = each.value.nsr_destination_port_range
  source_address_prefix  = each.value.nsr_source_address_prefix
  destination_address_prefix = each.value.nsr_destination_address_prefix
  resource_group_name  = var.resource_group_name
  network_security_group_name = module.nsg_sub_aks_prod.nsg_name
}

# Allow inbound hhtp and https connection to nsg sub aks agents
resource "azurerm_network_security_rule" "nsr_sub_agents" {
  for_each = var.nsg_rules_agents

  name                = each.value.nsr_name
  priority           = each.value.nsr_priority
  direction           = each.value.nsr_direction
  access              = each.value.nsr_access
  protocol            = each.value.nsr_protocol
  source_port_range    = each.value.nsr_source_port_range
  destination_port_ranges = each.value.nsr_destination_port_ranges
  destination_port_range = each.value.nsr_destination_port_range
  source_address_prefix  = each.value.nsr_source_address_prefix
  destination_address_prefix = each.value.nsr_destination_address_prefix
  resource_group_name  = var.resource_group_name
  network_security_group_name = module.nsg_sub_aks_agents.nsg_name
}