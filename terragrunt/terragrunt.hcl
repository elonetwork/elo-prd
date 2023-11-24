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
    resource_group_name  = "1-a6eb2255-playground-sandbox"
    storage_account_name = "storageaccountguru2"
    container_name       = "hubcontainer"
    key                  = "prod/${path_relative_to_include()}/terraform.tfstate"
  }
}

inputs = {
  location = "southcentralus"
  resource_group_name = "1-a6eb2255-playground-sandbox"
  client_id = "0f84da9c-4eb5-4b2d-991b-b7d2d5b966b8"
  client_secret = "d8_8Q~3XmNpV.rYWLMSxH2vhhi2hH31.Biz.NaC4"
}