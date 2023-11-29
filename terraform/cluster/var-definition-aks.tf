variable "location" {
  description = "Location for the Virtual Network"
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
}


variable "vnet_prod_id" {
  
}

variable "client_id" {
  
}

variable "client_secret" {
  
}

variable "sub_aks_prod_id" {
  
}

variable "azuread_grp_name" {
}

variable "private_link_dns_hub_name" {
}

variable "private_link_dns_prd_name" {
  
}

variable "cluster_name" {
  
}

variable "dns_prefix" {
  
}

variable "cluster_default_node_pool_name" {
  
}

variable "cluster_default_node_pool_node_count" {
  
}

variable "cluster_default_node_pool_vm_size" {
  
}

variable "cluster_default_node_pool_os_disk_size_gb" {
  
}

variable "cluster_tag" {
  
}

variable "cluster_network_profile_network_plugin" {
  
}

variable "cluster_network_profile_network_policy" {
  
}

variable "cluster_network_profile_load_balancer_sku" {
  
}

variable "appgateway_id" {
  
}


data "terraform_remote_state" "hub-infra" {
   backend = "azurerm"
    config = {
        key = "infrastructure/terraform.tfstate"
        resource_group_name = "1-edbb0a66-playground-sandbox"
        storage_account_name = "vsstorage4terraform"
        container_name = "hubcontainer"
    }
}