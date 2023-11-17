
variable "key_vault_name" {
}


variable "key_vault_enable_for_disk_encryption" {
}

variable "key_vault_soft_delete_retention_days" {
}

variable "key_vault_purge_protection_enabled" {
}

variable "key_vault_sku_name" {
}

variable "key_vault_access_policy_key_permissions" {
        type = list(string)
}
variable "key_vault_access_policy_secret_permissions" {
        type = list(string)
}
variable "key_vault_access_policy_storage_permissions" {
        type = list(string)
}
