include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../terraform//appgateway"
}

dependencies{
  paths = ["../infrastructure"]
}

dependency "infrastructure" {
  config_path  = "../infrastructure"
}

inputs = {
  vnet_prod_name = dependency.infrastructure.outputs.vnet_prod_name
  sub_appgatw_prod_id = dependency.infrastructure.outputs.sub_appgatw_prod_id
  appgatw_public_ip = "appgatw-public-ip"
}
