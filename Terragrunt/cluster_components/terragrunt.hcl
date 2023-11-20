include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}

terraform{
    source="../../Terraform//cluster_compnents/az-file"
}

inputs={
  name-az-file="aksfshare-elo-vnet-prd"
  storage_account_name="tfstatstorag"
  quota-az-file=5
}
