# module "nsg_sub_aks_prod" {
#   source              = "../modules/nsg/"
#   subnet_id           = var.sub_aks_prod_id
#   name                = var.nsg_sub_aks_prod_name
#   nsg_location        = var.location
#   resource_group_name = var.resource_group_name
# }