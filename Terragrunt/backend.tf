# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "azurerm" {
        key = "./terraform.tfstate"
        resource_group_name = "1-38f2be4d-playground-sandbox"
        storage_account_name = "tfstatstorag"
        container_name = "tfstate-prd"
  }
}
