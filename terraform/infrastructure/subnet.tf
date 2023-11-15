module "sub-aks-prod" {
  depends_on = [ module.vnet_prod ]
  source              = "../modules/subnet/"
  name                = var.sub_aks_prod_address_name
  resource_group_name = var.resource_group_name
  network_name        = var.vnet_prod_name
  address_prefixes    = [var.sub_aks_prod_address_prefixes]
}

module "sub-appgtw-prd" {
  depends_on = [ module.vnet_prod ]
  source              = "../modules/subnet/"
  name                = var.sub_appgtw_prd_name
  resource_group_name = var.resource_group_name
  network_name        = var.vnet_prod_name
  address_prefixes    = [var.sub_appgtw_prd_address_prefixes]
}