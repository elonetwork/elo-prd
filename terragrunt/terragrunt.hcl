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
    resource_group_name  = "1-83c03cee-playground-sandbox"
    storage_account_name = "storageaccountguru2"
    container_name       = "hubcontainer"
    key                  = "prod/${path_relative_to_include()}/terraform.tfstate"
  }
}

inputs = {
  location = "eastus"
  resource_group_name = "1-83c03cee-playground-sandbox"
  client_id = "12dc8844-5cf6-423f-85f3-8e605d490249"
  client_secret = "bR18Q~Q9MvLKTbvSkOd8qfPsnaVut1ufrNOSWclv"
}