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
    resource_group_name  = "1-d92c8c99-playground-sandbox"
    storage_account_name = "vsstorage4terraform"
    container_name       = "hubcontainer"
    key                  = "${path_relative_to_include()}/prod/terraform.tfstate"
  }
}

inputs = {
  location = "southcentralus"
  resource_group_name = "1-d92c8c99-playground-sandbox"
  ssh_public_key = file("C:/Users/LENOVO/.ssh/id_rsa.pub")
  client_id = "ba4605fa-e7ad-430f-8d6d-602995755763"
  client_secret = "eaQ8Q~THdYH72UrMUhiMBDlHdcrWH~8Ub1zL8cmv"
}