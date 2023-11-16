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
    resource_group_name  = "1-aedb1b32-playground-sandbox"
    storage_account_name = "storageaccountguru2"
    container_name       = "hubcontainer"
    key                  = "${path_relative_to_include()}/prod/terraform.tfstate"
  }
}

inputs = {
  location = "westus"
  resource_group_name = "1-aedb1b32-playground-sandbox"
  ssh_public_key = file("C:/Users/LENOVO/.ssh/id_rsa.pub")
  client_id = "5eb9e700-55bc-426f-9e5f-88a7a0126f30"
  client_secret = "VLQ8Q~4nhlVWKVcNDbC4.2GHJgolu5YPf3IHPbl-"
}