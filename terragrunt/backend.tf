# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "azurerm" {
    container_name       = "hubcontainer"
    key                  = "./prod/terraform.tfstate"
    resource_group_name  = "1-5df99f9d-playground-sandbox"
    storage_account_name = "storageaccountguru2"
  }
}