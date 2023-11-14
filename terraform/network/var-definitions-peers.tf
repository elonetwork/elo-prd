variable "vnet_prod_id" {
}

variable "vnet_prod_name" {
}

variable "resource_group_name" {
  
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