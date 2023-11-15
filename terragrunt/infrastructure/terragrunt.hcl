include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../terraform//infrastructure"
}

inputs = {
 
  vnet_prod_name = "vnet-prod"
  vnet_prod_address_space = "10.102.0.0/16"
  sub_aks_prod_address_prefixes =  "10.102.0.0/18"
  sub_aks_prod_address_name =  "sub-aks-prod"
  sub_appgtw_prod_address_prefixes =  "10.102.128.0/18"
  sub_appgtw_prod_address_name =  "sub-appgtw-prod"
}