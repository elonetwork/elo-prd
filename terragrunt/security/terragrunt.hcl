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

  agent_private_ip       = dependency.infrastructure.outputs.agent_private_ip
  sub_aks_prod_id       = dependency.infrastructure.outputs.sub_aks_prod_id
  nsg_sub_aks_prod_name = "nsg_sub_aks_prod_name"

  sub_aks_agents_id       = dependency.infrastructure.outputs.sub_aks_agents_id
  nsg_sub_aks_agents_name = "nsg_sub_aks_agents"

  nsg_rules_aks = {
    nsr_in_web_sub_aks = {
      "nsr_name" : "nsr_in_web_sub_aks",
      "nsg_name" : "nsg_sub_aks_prod",
      "nsr_priority" : 111,
      "nsr_direction" : "Inbound",
      "nsr_access" : "Allow",
      "nsr_protocol" : "*",
      "nsr_source_port_range" : "*",
      "nsr_destination_port_range" : null,
      "nsr_destination_port_ranges" : ["80", "443", "53"],
      "nsr_source_address_prefix" : "*",
      "nsr_destination_address_prefix" : "*",
    },
    nsr_out_sub_aks = {
      "nsr_name" : "nsr_out_sub_aks",
      "nsg_name" : "nsg_sub_aks_prod",
      "nsr_priority" : 111,
      "nsr_direction" : "Outbound",
      "nsr_access" : "Allow",
      "nsr_protocol" : "*",
      "nsr_source_port_range" : "*",
      "nsr_destination_port_ranges" : null,
      "nsr_destination_port_range" : "*",
      "nsr_source_address_prefix" : "*",
      "nsr_destination_address_prefix" : "*",
    },
  }

nsg_rules_agents = {
    nsr_in_web_sub_aks_agents = {
      "nsr_name" : "nsr_in_web_sub_aks_agents",
      "nsg_name" : "nsg_sub_aks_agents",
      "nsr_priority" : 111,
      "nsr_direction" : "Inbound",
      "nsr_access" : "Allow",
      "nsr_protocol" : "*",
      "nsr_source_port_range" : "*",
      "nsr_destination_port_range" : null,
      "nsr_destination_port_ranges" : ["80", "443", "53"],
      "nsr_source_address_prefix" : "*",
      "nsr_destination_address_prefix" : "*",
    },
    nsr_out_sub_aks_agents = {
      "nsr_name" : "nsr_out_sub_aks_agents",
      "nsg_name" : "nsg_sub_aks_agents",
      "nsr_priority" : 111,
      "nsr_direction" : "Outbound",
      "nsr_access" : "Allow",
      "nsr_protocol" : "*",
      "nsr_source_port_range" : "*",
      "nsr_destination_port_ranges" : null,
      "nsr_destination_port_range" : "*",
      "nsr_source_address_prefix" : "*",
      "nsr_destination_address_prefix" : "*",
    },
    nsr_in_ssh_sub_aks_agents = {
      "nsr_name" : "nsr_in_ssh_sub_aks_agents",
      "nsg_name" : "nsg_sub_aks_agents",
      "nsr_priority" : 110,
      "nsr_direction" : "Inbound",
      "nsr_access" : "Allow",
      "nsr_protocol" : "*",
      "nsr_source_port_range" : "*",
      "nsr_destination_port_range" : null,
      "nsr_destination_port_ranges" : ["22"],
      "nsr_source_address_prefix" : "*",
      "nsr_destination_address_prefix" : "*",
    },
  }
}
