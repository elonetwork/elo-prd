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
    resource_group_name  = "1-72aef33e-playground-sandbox"
    storage_account_name = "storageaccountguru2"
    container_name       = "hubcontainer"
    key                  = "prod/${path_relative_to_include()}/terraform.tfstate"
  }
}

inputs = {
  location = "southcentralus"
  resource_group_name = "1-72aef33e-playground-sandbox"
  client_id = "13583b2c-5c27-4b9d-bc0c-2c44609e0da5"
  client_secret = "TQ68Q~BfqoHV~b7vgi1U91CRIWcuqBhklS12tc8j"
}