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
    resource_group_name  = "1-3af8eafc-playground-sandbox"
    storage_account_name = "storageaccountguru2"
    container_name       = "hubcontainer"
    key                  = "prod/${path_relative_to_include()}/terraform.tfstate"
  }
}

inputs = {
  location = "southcentralus"
  resource_group_name = "1-3af8eafc-playground-sandbox"
  client_id = "dbbefe00-57d6-4523-8efb-b43ef503379e"
  client_secret = "MCB8Q~dEo6y2ktisqTK5iOF42Y9vFGSqdCQpGbYQ"
}