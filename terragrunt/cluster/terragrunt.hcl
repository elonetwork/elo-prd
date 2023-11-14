include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../terraform//cluster"
}

dependencies{
  paths = ["../infrastructure"]
}

dependency "infrastructure" {
  config_path  = "../infrastructure"
}


inputs = {
  vnet_prod_id = dependency.infrastructure.outputs.vnet_prod_id
  sub_aks_prod_id = dependency.infrastructure.outputs.sub_aks_prod_id


}
