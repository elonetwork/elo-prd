include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}

terraform{
    source="../../Terraform//Infrastructure/"
}

inputs = {
    name-vnet= "vnet-prd"
    address-space-vnet = [ "10.200.0.0/16" ]
    name-subnet-aks="sub-aks-prd"
    address-prefixes-subnet-aks=["10.200.1.0/24"]
    name-subnet-appgtw="sub-appgtw-prd"
    address-prefixes-subnet-appgtw=["10.200.2.0/24"]
}