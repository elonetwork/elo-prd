include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../terraform//security"
}

dependencies{
  paths = ["../infrastructure"]
}

dependency "infrastructure" {
  config_path  = "../infrastructure"
}

inputs = {
  sub_aks_prod_id = dependency.infrastructure.outputs.sub_aks_prod_id
  sub_aks_prod_id = dependency.infrastructure.outputs.sub_aks_prod_id
  nsg_sub_aks_prod_name = "nsg_sub_aks_prod"
  nsr_in_web_sub_aks_priority = 111
  nsr_in_web_sub_aks_direction = "Inbound"
  nsr_in_web_sub_aks_access = "Allow"
  nsr_in_web_sub_aks_protocol = "*"
  nsr_in_web_sub_aks_source_port_range = "*"
  nsr_in_web_sub_aks_destination_port_ranges = ["80", "443", "53"]
  nsr_in_web_sub_aks_source_address_prefix = "*"
  nsr_in_web_sub_aks_destination_address_prefix = "*"

  nsr_in_web_sub_aks_name="nsr-in-web-sub-aks"
}
