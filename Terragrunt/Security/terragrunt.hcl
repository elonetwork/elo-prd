include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}

terraform{
    source="../../Terraform//Securite/"
}

dependencies {
  paths = ["../Infrastructure/"]
}

dependency "subnet-aks" {
  config_path = "../Infrastructure/"
}

dependency "subnet-appgtw" {
  config_path = "../Infrastructure/"
}

inputs = {
  name-aks="nsg_aks-prd"
  name-appgtw="nsg-appgtw-prd"
  subnet-aks=dependency.subnet-aks.outputs.subnet-aks-id
   subnet-appgtw=dependency.subnet-appgtw.outputs.subnet-appgtw-id
  access-allow="Allow"
  direction-outbound="Outbound"
   name-nsg-https-allow-outbound-aks-prd="nsg-https-allow-outbound-aks-prd"
   value-etoile="*"
   port-443="443"
   priority-100=100
   priority-110=110
   port-80="80"
   protocol-tcp="Tcp"
   name-nsg-http-allow-outbound-aks-prd="nsg-http-allow-outbound-aks-prd"
   name-nsg-https-allow-inbound-appgtw-prd="nsg-https-allow-inbound-appgtw-prd"
   name-nsg-https-allow-outbound-appgtw-prd="nsg-https-allow-outbound-appgtw-prd"
   priority-1000=1000
  direction-inbound="Inbound"
  access-deny="Deny"
  name-nsg-https-allow-inbound-aks-prd="https-allow-inbound-aks-prd"
 name-nsg-http-allow-inbound-aks-prd="http-allow-outbound-aks-prd"
}