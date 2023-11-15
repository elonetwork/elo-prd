data "terraform_remote_state" "vnet-hub" {
   backend = "azurerm"
    config = {
        key = "Infrastructure/terraform.tfstate"
        resource_group_name = "1-3203d254-playground-sandbox"
        storage_account_name = "tfstatstorag"
        container_name = "tfstate"
    }
}

data "azuread_client_config" "current" {}

resource "azuread_group" "example" {
  display_name     = "grp-aks"
  owners           = [data.azuread_client_config.current.object_id]
  security_enabled = true
}

resource "azuread_group_member" "example_member" {
  group_object_id  = azuread_group.example.id
  member_object_id = data.azuread_client_config.current.object_id
}

resource "azurerm_private_dns_zone" "private-zone" {
  name                = "dnselo.private.eastus.azmk8s.io"
  resource_group_name = var.resource_group_name
}
resource "azurerm_private_dns_zone_virtual_network_link" "private-zone-vnet-link-2" {
  name                  = "privatelink-vnet-link-hub"
  private_dns_zone_name = azurerm_private_dns_zone.private-zone.name
  resource_group_name   = var.resource_group_name
  virtual_network_id    = data.terraform_remote_state.vnet-hub.outputs.vnet-hub-id
  registration_enabled  = true
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aks-cluster-name
  resource_group_name = var.resource_group_name
  location            = var.location

  network_profile {
    network_plugin = var.network_plugin
  }

  private_cluster_enabled = var.private_cluster_enabled
  private_dns_zone_id     = azurerm_private_dns_zone.private-zone.id
  dns_prefix              = var.dns_prefix

  azure_active_directory_role_based_access_control {
    managed            = true
    azure_rbac_enabled = true
  }
 private_cluster_public_fqdn_enabled = var.private_cluster_public_fqdn_enabled

 service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }
  default_node_pool {
    name           = "nodepool"
    vm_size        = var.vm_size
    node_count     = var.node_count
    vnet_subnet_id = var.vnet_subnet_aks_id

  }
}