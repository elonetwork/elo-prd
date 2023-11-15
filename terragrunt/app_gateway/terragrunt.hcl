include "root" {
  path = find_in_parent_folders()
}

terraform{
    source="../../Terraform//app-gateway/"
}

dependencies {
  paths = ["../infrastructure"]
}

dependency "infrastructure" {  //export module 
  config_path  = "../infrastructure"
}



inputs = {
  app_gateway_subnet_id = dependency.infrastructure.outputs.sub_appgw_prod_id
}