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
    resource_group_name  = "1-41de7353-playground-sandbox"
    storage_account_name = "vsstorage4terraform"
    container_name       = "hubcontainer"
    key                  = "${path_relative_to_include()}/prod/terraform.tfstate"
  }
}

inputs = {
  location = "southcentralus"
  resource_group_name = "1-41de7353-playground-sandbox"
  ssh_public_key = file("C:/Users/LENOVO/.ssh/id_rsa.pub")
  client_id = "d2e5563a-c4cc-481f-a219-49ed280caf69"
  client_secret = "df.8Q~6742GYD4QzJ.IjwqUr1N~~HeahOKqnxaVh"

}