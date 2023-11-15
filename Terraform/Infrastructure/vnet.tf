resource "azurerm_virtual_network" "vnet-prd" {
  name                = var.name-vnet
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address-space-vnet
}