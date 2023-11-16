variable "location" {
  type    = string
  default = ""
}

variable "resource_group_name" {
  type    = string
  default = ""
  
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "aks-cluster-name" {
  type = string
}
variable "network_plugin" {
  type = string
}

variable "private_cluster_enabled" {
  type = bool
}

variable "dns_prefix" {
  type = string
}

variable "private_cluster_public_fqdn_enabled" {
  type = bool
}

variable "vm_size" {
  type = string
}

variable "node_count" {
  type = number
}

variable "vnet_subnet_aks_id" {
  type = string
}

variable "acr_name" {
}

variable "acr_sku" {
  
}
variable "acr_admin_enabled" {
  
}
variable "key_vault_name" {
}

variable "key_vault_soft_delete_retention_days" {
}

variable "key_vault_purge_protection_enabled" {
}

variable "key_vault_sku_name" {
}

variable "key_vault_enabled_for_disk_encryption" {
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