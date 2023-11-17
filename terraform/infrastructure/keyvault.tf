data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  # name                        = "vskeyvault"
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = var.key_vault_enable_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = var.key_vault_soft_delete_retention_days
  purge_protection_enabled    = var.key_vault_purge_protection_enabled

  sku_name = var.key_vault_sku_name

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = var.key_vault_access_policy_key_permissions

    secret_permissions = var.key_vault_access_policy_secret_permissions

    storage_permissions = var.key_vault_access_policy_storage_permissions
  }
}