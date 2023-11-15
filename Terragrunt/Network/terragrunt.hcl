include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}

terraform{
    source="../../Terraform//Network/"
}

dependency "vnet-prd" {
  config_path = "../Infrastructure/"
}

inputs = {
  name-peering-bastion-cluster="peering_bastion_cluster"
  name-peering-cluster-bastion="peering_cluster_bastion"
  virtual-network-name-cluster=dependency.vnet-prd.outputs.vnet-prd-name
  cluster-remote-virtual-network-id=dependency.vnet-prd.outputs.vnet-prd-id
}
