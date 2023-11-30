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
    name-network_interface-agent="app_interface_agent"
  name-vm-agent="vm-agent"
  vm-size-agent = "Standard_DS1_v2"
  computer-name-agent  = "hostname-agent"
   admin-username-vm-agent="yassine"
   password-vm-agent="OmPassword123"
}