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
        resource_group_name = "1-47b00d92-playground-sandbox"
        storage_account_name = "hubspokesacount"
        container_name = "statecontainer"
    }
}