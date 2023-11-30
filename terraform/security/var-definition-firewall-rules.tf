data "terraform_remote_state" "hub-security" {
   backend = "azurerm"
    config = {
        key = "hub/security/terraform.tfstate"
        resource_group_name = "1-83c03cee-playground-sandbox"
        storage_account_name = "storageaccountguru2"
        container_name = "hubcontainer"
    }
}

variable "agent_private_ip" {
  
}
