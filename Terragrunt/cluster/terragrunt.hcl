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
  client_id="f5289753-de31-43ef-a0bc-b7b07cd7193f"
  client_secret="Vt18Q~gCbsIvzKXXd6kw2KqY4NGpa97bIZctWa55"
  name-appgtw="nsg-appgtw-prd"
  vnet_subnet_aks_id=dependency.subnet-aks.outputs.subnet-aks-id
  aks-cluster-name="aks_cluster"
  network_plugin="azure"
  private_cluster_enabled=true
  dns_prefix="dnspref"
  private_cluster_public_fqdn_enabled=false
  vm_size="Standard_D2s_v3"
  node_count=3
}