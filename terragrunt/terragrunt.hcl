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
    resource_group_name  = "1-b7dbe36f-playground-sandbox"
    storage_account_name = "storageaccountguru2"
    container_name       = "hubcontainer"
    key                  = "prod/${path_relative_to_include()}/terraform.tfstate"
  }
}

inputs = {
  location = "eastus"
  resource_group_name = "1-b7dbe36f-playground-sandbox"
  client_id = "d09775b6-3108-4021-95dc-0c12537a420f"
  client_secret = "_Ht8Q~aD3XIhS~QhsM4LUndIBG0oh.R0yYI4OcQS"
}