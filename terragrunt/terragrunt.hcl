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
    resource_group_name  = "1-55151931-playground-sandbox"
    storage_account_name = "storageaccountguru2"
    container_name       = "hubcontainer"
    key                  = "prod/${path_relative_to_include()}/terraform.tfstate"
  }
}

inputs = {
  location = "southcentralus"
  resource_group_name = "1-55151931-playground-sandbox"
  client_id = "e00f657f-6e4f-4e2a-968d-ce7190fd981f"
  client_secret = "HN_8Q~1fK8K_K_aV8m1ybZQybuuxakkzqtlJ0bPc"
}