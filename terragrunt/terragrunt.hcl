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
    resource_group_name  = "1-1f1a8d09-playground-sandbox"
    storage_account_name = "vsstorage4terraform"
    container_name       = "hubcontainer"
    key                  = "${path_relative_to_include()}/prod/terraform.tfstate"
  }
}

inputs = {
  location = "southcentralus"
  resource_group_name = "1-1f1a8d09-playground-sandbox"
  ssh_public_key = file("C:/Users/LENOVO/.ssh/id_rsa.pub")
  client_id = "6e38b96c-744a-4f6a-8c9d-d1be4eeba48d"
  client_secret = "5OQ8Q~KKagDaAV-FyC8tUF3SsvCQMTaCk1PIbbWr"
}