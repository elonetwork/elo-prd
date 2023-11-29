variable "vnet_prod_id" {
}

variable "vnet_prod_name" {
}

variable "resource_group_name" {
  
}

variable "peer_hub_to_prod_name" {
  
}

variable "peer_prod_to_hub_name" {
  
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