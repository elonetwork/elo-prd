include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../terraform//network"
}

dependencies{
  paths = ["../infrastructure"]
}

dependency "infrastructure" {
  config_path  = "../infrastructure"
}

inputs = {
  sub_aks_prod_id = dependency.infrastructure.outputs.sub_aks_prod_id
  vnet_prod_id = dependency.infrastructure.outputs.vnet_prod_id
  vnet_prod_name = dependency.infrastructure.outputs.vnet_prod_name
  peer_hub_to_prod_name = "peer_hub_to_prod"
  peer_prod_to_hub_name = "peer_prod_to_hub"
}
