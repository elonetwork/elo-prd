generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "azurerm" {
  features {
     key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
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
    resource_group_name  = "1-edbb0a66-playground-sandbox"
    storage_account_name = "vsstorage4terraform"
    container_name       = "hubcontainer"
    key                  = "${path_relative_to_include()}/prod/terraform.tfstate"
  }
}

inputs = {
  location = "southcentralus"
  resource_group_name = "1-edbb0a66-playground-sandbox"
  ssh_public_key = file("C:/Users/LENOVO/.ssh/id_rsa.pub")
  client_id = "41aeef80-a766-4510-8ec9-4bc44768bbe0"
  client_secret = "6KC8Q~eVriCmm8yeaXlOav4wEtHT2TckUcwsKb8z"
}