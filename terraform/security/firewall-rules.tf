# direct traffic from agent vm to go through the firewall
resource "azurerm_route_table" "squid_route_table" {
  name                = "agent-vm-route-table"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_route" "squid_route" {
  name                   = "default"
  route_table_name       = azurerm_route_table.squid_route_table.name
  resource_group_name    = azurerm_route_table.squid_route_table.resource_group_name
  address_prefix         = "0.0.0.0/0"
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = data.terraform_remote_state.hub-security.outputs.firewall_private_ip
}

resource "azurerm_subnet_route_table_association" "squid_association" {
  subnet_id      = var.sub_aks_agents_id
  route_table_id = azurerm_route_table.squid_route_table.id
}

resource "azurerm_firewall_network_rule_collection" "FNR_allow_web" {
  name                = "FNR_allow_web_agent"
  azure_firewall_name = data.terraform_remote_state.hub-security.outputs.azure_firewall_name
  resource_group_name = var.resource_group_name
  priority            = 102
  action              = "Allow"

  rule {
    name = "allow_web"

    source_addresses = [
      var.agent_private_ip,
    ]

    destination_ports = [
      "53","443","80"
    ]

    destination_addresses = [
      "0.0.0.0/0",
    ]

    protocols = ["Any"]
  }
}