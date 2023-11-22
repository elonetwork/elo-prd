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
    resource_group_name  = "1-80636d78-playground-sandbox"
    storage_account_name = "storageaccountguru2"
    container_name       = "hubcontainer"
    key                  = "prod/${path_relative_to_include()}/terraform.tfstate"
  }
}

inputs = {
  location = "eastus"
  resource_group_name = "1-80636d78-playground-sandbox"
  client_id = "10f5de26-7ece-45d9-916b-ceae438dda18"
  client_secret = "gAS8Q~9o8zXiJzNXc.LmU5oPGGOGiIFQDJWBXbmq"
}