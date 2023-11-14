module "vnet_prod" {
  source              = "../modules/vnet/"
  name                = var.vnet_prod_name
  address_space       = [var.vnet_prod_address_space]
  location            = var.location
  resource_group_name = var.resource_group_name
}
