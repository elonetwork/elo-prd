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
    resource_group_name  = "1-aff8b543-playground-sandbox"
    storage_account_name = "hubspokesacount"
    container_name       = "statecontainer"
    key                  = "${path_relative_to_include()}/prod/terraform.tfstate"
  }
}

inputs = {
  location = "westus"
  resource_group_name = "1-aff8b543-playground-sandbox"
  ssh_public_key = file("C:/Users/MSI/.ssh/id_rsa.pub")
  client_id = "5bcb6ff7-f7f0-4429-81ff-73a5af41b722"
  client_secret = "PC08Q~x9Y7xyhPwQnfFr8AlMe5baiPMbJbwbwayX"
}