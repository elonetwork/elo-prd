include "config" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../terraform//infrastructure"
}

inputs = {
  vnet_prod_name = "vnet-prod"
  vnet_prod_address_space = "10.102.0.0/16"
  sub_aks_prod_address_prefixes =  "10.102.0.0/18"
  sub_aks_prod_address_name =  "sub-aks-prod"

  sub_appgatw_prod_address_prefixes =  "10.102.64.0/18"
  sub_appgatw_prod_address_name =  "sub-appgatw-prod"

  acr_name = "acrelo32"
  acr_sku = "Premium"
  acr_admin_enabled = false
  key_vault_name = "kvprd51321"

  key_vault_enable_for_disk_encryption = true
  key_vault_soft_delete_retention_days = 7
  key_vault_purge_protection_enabled = false
  key_vault_sku_name = "standard"
  key_vault_access_policy_key_permissions = ["Get"]
  key_vault_access_policy_secret_permissions = ["Get"]
  key_vault_access_policy_storage_permissions = ["Get"]


}