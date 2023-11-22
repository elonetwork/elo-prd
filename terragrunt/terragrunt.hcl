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
    resource_group_name  = "1-5b8fc781-playground-sandbox"
    storage_account_name = "vsstorage4terraform"
    container_name       = "hubcontainer"
    key                  = "${path_relative_to_include()}/prod/terraform.tfstate"
  }
}

inputs = {
  location = "southcentralus"
  resource_group_name = "1-5b8fc781-playground-sandbox"
  ssh_public_key = file("C:/Users/LENOVO/.ssh/id_rsa.pub")
  client_id = "b1c97cf5-5539-4e6a-a4c9-40ac5e7da8af"
  client_secret = "TVQ8Q~gLG1KPUjJIYtFp.cZAepaLHD11VXDl~bs5"
}