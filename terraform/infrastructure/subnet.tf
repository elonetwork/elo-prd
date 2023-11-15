module "sub-aks-prod" {
  depends_on = [ module.vnet_prod ]
  source              = "../modules/subnet/"
  name                = var.sub_aks_prod_address_name
  resource_group_name = var.resource_group_name
  network_name        = var.vnet_prod_name
  address_prefixes    = [var.sub_aks_prod_address_prefixes]
}

module "sub-appgatw-prod" {
  depends_on = [ module.vnet_prod ]
  source              = "../modules/subnet/"
  name                = var.sub_appgatw_prod_address_name
  resource_group_name = var.resource_group_name
  network_name        = var.vnet_prod_name
  address_prefixes    = [var.sub_appgatw_prod_address_prefixes]
}