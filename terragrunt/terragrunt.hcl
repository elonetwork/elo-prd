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
    resource_group_name  = "1-422fb5af-playground-sandbox"
    storage_account_name = "storageaccountguru2"
    container_name       = "hubcontainer"
    key                  = "prod/${path_relative_to_include()}/terraform.tfstate"
  }
}

inputs = {
  location = "eastus"
  resource_group_name = "1-422fb5af-playground-sandbox"
  client_id = "b7faf749-a511-4e15-a041-6208fd8dd2b8"
  client_secret = "bEY8Q~4E7UvmyzqkbwNZOxEt7O0UAutMZISB7c1m"
}