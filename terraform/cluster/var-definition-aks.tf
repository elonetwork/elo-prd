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

data "terraform_remote_state" "hub-infra" {
   backend = "azurerm"
    config = {
        key = "infrastructure/terraform.tfstate"
        resource_group_name = "1-1284a985-playground-sandbox"
        storage_account_name = "storageaccountguru3"
        container_name = "hubcontainer"
    }
}