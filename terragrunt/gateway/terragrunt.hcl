include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../terraform//gateway"
}

dependencies{
  paths = ["../infrastructure"]
}

dependency "infrastructure" {
  config_path  = "../infrastructure"
}


inputs = {
  sub_appgtw_prd_id = dependency.infrastructure.outputs.sub_appgtw_prd_id
  application_gateway_name = "app-gtw-prd"
}
