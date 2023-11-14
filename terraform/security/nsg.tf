module "nsg_sub_aks_prod" {
  source              = "../modules/nsg/"
  subnet_id           = var.sub_aks_prod_id
  name                = "nsg_sub_aks_prod"
  nsg_location        = var.location
  resource_group_name = var.resource_group_name
}