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
  sub_appgtw_prod_id = dependency.infrastructure.outputs.sub_appgtw_prod_id
  vnet_prod_id = dependency.infrastructure.outputs.vnet_prod_id
  vnet_prod_name = dependency.infrastructure.outputs.vnet_prod_name
  application_gateway_name ="appgtwprd"

}
