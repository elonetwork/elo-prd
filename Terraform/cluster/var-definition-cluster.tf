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