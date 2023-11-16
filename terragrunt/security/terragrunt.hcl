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
  key_vault_name = "keyvaulteloAM"
  key_vault_soft_delete_retention_days = 7
  key_vault_purge_protection_enabled = false
  key_vault_sku_name = "standard"
  key_vault_enabled_for_disk_encryption = true
  key_vault_access_policy_key_permissions = ["Get"]
  key_vault_access_policy_secret_permissions = ["Get"]
  key_vault_access_policy_storage_permissions = ["Get"]
  nsg_rules  = {
    nsr_in_web_sub_aks = {
        "nsr_name": "nsr_in_web_sub_aks",
        "nsg_name": "nsg_sub_aks_prod",
        "nsr_priority": 111,
        "nsr_direction": "Inbound",
        "nsr_access": "Allow",
        "nsr_protocol": "*",
        "nsr_source_port_range": "*",
        "nsr_destination_port_range": null,
        "nsr_destination_port_ranges": ["80", "443", "53"],
        "nsr_source_address_prefix": "*",
        "nsr_destination_address_prefix": "*",
    },
    nsr_out_sub_aks = {
        "nsr_name": "nsr_out_sub_aks",
        "nsg_name": "nsg_sub_aks_prod",
        "nsr_priority": 111,
        "nsr_direction": "Outbound",
        "nsr_access": "Allow",
        "nsr_protocol": "*",
        "nsr_source_port_range": "*",
        "nsr_destination_port_ranges": null,
        "nsr_destination_port_range": "*",
        "nsr_source_address_prefix": "*",
        "nsr_destination_address_prefix": "*",
    },
}


}
