resource "azurerm_virtual_network_peering" "hub_to_prod" {
  name                         = var.peer_hub_to_prod_name
  resource_group_name          = var.resource_group_name
  virtual_network_name         = var.vnet_prod_name
  remote_virtual_network_id    = data.terraform_remote_state.hub-infra.outputs.vnet_hub_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
}

resource "azurerm_virtual_network_peering" "prod_to_hub" {
  name                         = var.peer_prod_to_hub_name
  resource_group_name          = var.resource_group_name
  virtual_network_name         = data.terraform_remote_state.hub-infra.outputs.vnet_hub_name
  remote_virtual_network_id    = var.vnet_prod_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
}