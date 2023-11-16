include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../terraform//cluster"
}

dependencies{
  paths = ["../infrastructure"]
}

dependency "infrastructure" {
  config_path  = "../infrastructure"
}


inputs = {
  vnet_prod_id = dependency.infrastructure.outputs.vnet_prod_id
  sub_aks_prod_id = dependency.infrastructure.outputs.sub_aks_prod_id
  azuread_grp_name = "grp-aks"
  private_link_dns_hub_name = "privatelink-vnet-link-hub"
  private_link_dns_prd_name = "privatelink-vnet-link-prd"
  cluster_name = "aks-prd"
  dns_prefix = "sos"
  cluster_default_node_pool_name =  "akspoolprd"
  cluster_default_node_pool_node_count = 2
  cluster_default_node_pool_vm_size = "Standard_B2s"
  cluster_default_node_pool_os_disk_size_gb = 30
  cluster_tag = "Production"
  cluster_network_profile_network_plugin = "azure"
  cluster_network_profile_network_policy = "azure"
  cluster_network_profile_load_balancer_sku = "standard"
  acr_id = dependency.infrastructure.outputs.acr_id

}
