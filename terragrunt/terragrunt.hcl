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
    resource_group_name  = "1-514020f9-playground-sandbox"
    storage_account_name = "storageaccountguru2"
    container_name       = "hubcontainer"
    key                  = "prod/${path_relative_to_include()}/terraform.tfstate"
  }
}

inputs = {
  location = "eastus"
  resource_group_name = "1-514020f9-playground-sandbox"
  client_id = "f22b4c97-16d4-48e4-a67a-1a4d0008cb72"
  client_secret = "c2p8Q~WsdA~U0__EW9uS02j~DsAxaUbBkZ2IicB2"
}