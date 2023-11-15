data "terraform_remote_state" "vnet-hub" {
   backend = "azurerm"
    config = {
        key = "Infrastructure/terraform.tfstate"
        resource_group_name = "1-3203d254-playground-sandbox"
        storage_account_name = "tfstatstorag"
        container_name = "tfstate"
    }
}

resource "azurerm_virtual_network_peering" "peering_bastion_cluster" {
  name                      = var.name-peering-bastion-cluster
  resource_group_name       = var.resource_group_name
  virtual_network_name      = data.terraform_remote_state.vnet-hub.outputs.vnet-hub-name
  remote_virtual_network_id = var.cluster-remote-virtual-network-id
}

resource "azurerm_virtual_network_peering" "peering_cluster_bastion" {
  name                      = var.name-peering-cluster-bastion
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.virtual-network-name-cluster
  remote_virtual_network_id = data.terraform_remote_state.vnet-hub.outputs.vnet-hub-id
}