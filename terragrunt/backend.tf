# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "azurerm" {
    container_name       = "hubcontainer"
    key                  = "prod/./terraform.tfstate"
    resource_group_name  = "1-3af8eafc-playground-sandbox"
    storage_account_name = "storageaccountguru2"
  }
}
