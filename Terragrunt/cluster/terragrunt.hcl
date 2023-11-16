include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}

terraform{
    source="../../Terraform//cluster/"
}


dependencies {
  paths = ["../Infrastructure/"]
}

dependency "subnet-aks" {
  config_path = "../Infrastructure/"
}


inputs = {
  client_id="8a5cf1b9-30ab-4024-9e68-b36eb0efc20c"
  client_secret="Dkt8Q~EEw_JFmrm3IPY6sSF6OudhAYfZY-UktbO7"
  name-appgtw="nsg-appgtw-prd"
  vnet_subnet_aks_id=dependency.subnet-aks.outputs.subnet-aks-id
  aks-cluster-name="aks_cluster"
  network_plugin="azure"
  private_cluster_enabled=true
  dns_prefix="dnspref"
  private_cluster_public_fqdn_enabled=false
  vm_size="Standard_D2s_v3"
  node_count=3
   acr_name  = "elocontainerregistryv11"
  acr_sku = "Standard"
  acr_admin_enabled = false
  key_vault_name = "elonetworkkeyvaultv11"
  key_vault_soft_delete_retention_days = 7
  key_vault_purge_protection_enabled = false
  key_vault_sku_name = "standard"
  key_vault_enabled_for_disk_encryption = true
  key_vault_access_policy_key_permissions = ["Get"]
  key_vault_access_policy_secret_permissions = ["Get"]
  key_vault_access_policy_storage_permissions = ["Get"]
}