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
    resource_group_name  = "1-543f889c-playground-sandbox"
    storage_account_name = "storageaccountguru2"
    container_name       = "hubcontainer"
    key                  = "prod/${path_relative_to_include()}/terraform.tfstate"
  }
}

inputs = {
  location = "southcentralus"
  resource_group_name = "1-543f889c-playground-sandbox"
  client_id = "b5a5d508-1f88-4cf0-acb8-52cbb4c84168"
  client_secret = "smU8Q~nMe~kJkDWD6ekvq2rtheS_NG20t4UcGbVd"
}