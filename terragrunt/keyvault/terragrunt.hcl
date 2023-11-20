include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../terraform//keyvault"
}

inputs = {
  key_vault_name = "elonetworkkeyvaulttest"
  key_vault_soft_delete_retention_days = 7
  key_vault_purge_protection_enabled = false
  key_vault_sku_name = "standard"
  key_vault_enabled_for_disk_encryption = true
  key_vault_access_policy_key_permissions = ["Get"]
  key_vault_access_policy_secret_permissions = ["Get"]
  key_vault_access_policy_storage_permissions = ["Get"]

}

