generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "azurerm" {
  features {}
    skip_provider_registration = true
}
EOF
}

remote_state {
  backend = "azurerm"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    resource_group_name  = "1-6714340f-playground-sandbox"
    storage_account_name = "storageaccountguru2"
    container_name       = "hubcontainer"
    key                  = "prod/${path_relative_to_include()}/terraform.tfstate"
  }
}

inputs = {
  location = "westus"
  resource_group_name = "1-6714340f-playground-sandbox"
  client_id = "60d49c27-1fc1-4ad9-b9a7-380e63b19605"
  client_secret = "ow18Q~4zgNFUZj1izRenWhQ3L96cBsGuGti4xbEG"
}