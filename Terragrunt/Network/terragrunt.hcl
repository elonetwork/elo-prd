include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}

terraform{
    source="../../Terraform//Network/"
}

dependency "vnet-prd" {
  config_path = "../Infrastructure/"
}

dependency "subnet-aks-prd" {
  config_path = "../Infrastructure/"
}

dependency "subnet-appgtw" {
  config_path = "../Infrastructure/"
}

inputs = {
  name-peering-bastion-cluster="peering_bastion_cluster"
  name-peering-cluster-bastion="peering_cluster_bastion"
  virtual-network-name-cluster=dependency.vnet-prd.outputs.vnet-prd-name
  cluster-remote-virtual-network-id=dependency.vnet-prd.outputs.vnet-prd-id
  subnet-id-gateway=dependency.subnet-appgtw.outputs.subnet-appgtw-id
  /* public-ip-app-gateway="public-ip-app-gateway"
  allocation_method="Dynamic"
  name-app-gateway="app-gateway-prd"
  sku-name="WAF_v2"
  sku-tier="WAF_v2"
  name-gateway-ip-configuration="gateway-ip-configuration"
  subnet-id-gateway=dependency.subnet-aks-prd.outputs.subnet-aks-id
    name-frontend-port-gateway="frontend-port-gateway"
  frontend-port-gateway=80
  name-frontend-ip-configuration="frontend-ip-configuration"
  name-backend-address-pool="backend-address-pool"
  name-backend-http-settings="backend-http-settings"
  cookie-based-affinity="Disabled"
  backend-http-settings-path=""
  port-backend-http-settings=80
  protocol-backend-http-settings="Http"
  request-timeout-backend-http-settings=60
  name-http-listener="http-listener"
  name-request-routing-rule="routing-rule"
  rule-type="Basic"
  priority=9
  url-path-map-name="elo"
  capacity=2 */
   name-app-gateway="app-gateway-prd"
}
