module "nsg_sub_aks_prod" {
  source              = "../modules/nsg/"
  subnet_id           = var.sub_aks_prod_id
  name                = "nsg_sub_aks_prod"
  nsg_location        = var.location
  resource_group_name = var.resource_group_name
}

module "nsg_sub_appgtw_prod" {
  source              = "../modules/nsg/"
  subnet_id           = var.sub_appgtw_prod_id
  name                = "nsg_sub_appgtw_prod"
  nsg_location        = var.location
  resource_group_name = var.resource_group_name
}