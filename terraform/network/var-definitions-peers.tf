variable "vnet_prod_id" {
}

variable "vnet_prod_name" {
}

variable "resource_group_name" {
  
}
variable "location" {
  description = "Location for the Virtual Network"
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