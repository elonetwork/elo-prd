data "azuread_client_config" "current" {}

resource "azuread_group" "example" {
  display_name     = var.azuread_grp_name
  owners           = [data.azuread_client_config.current.object_id]
  security_enabled = true
}

resource "azuread_group_member" "example_member" {
  group_object_id  = azuread_group.example.id
  member_object_id = data.azuread_client_config.current.object_id
}

resource "azurerm_private_dns_zone" "private-zone" {
  name                = "elonetwork.private.${var.location}.azmk8s.io"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "private-zone-vnet-link-hub" {
  name                  = var.private_link_dns_hub_name
  private_dns_zone_name = azurerm_private_dns_zone.private-zone.name
  resource_group_name   = var.resource_group_name
  virtual_network_id    = data.terraform_remote_state.hub-infra.outputs.vnet_hub_id
  registration_enabled  = true
}

resource "azurerm_private_dns_zone_virtual_network_link" "private-zone-vnet-link-prod" {
  name                  = var.private_link_dns_prd_name
  private_dns_zone_name = azurerm_private_dns_zone.private-zone.name
  resource_group_name   = var.resource_group_name
  virtual_network_id    = var.vnet_prod_id
  registration_enabled  = true
}

resource "azurerm_kubernetes_cluster" "aks-prd" {

  depends_on = [azurerm_private_dns_zone.private-zone]
  name                                = var.cluster_name
  location                            = var.location
  resource_group_name                 = var.resource_group_name
  dns_prefix                          = var.dns_prefix
  private_dns_zone_id                 = azurerm_private_dns_zone.private-zone.id
  private_cluster_enabled             = true
  private_cluster_public_fqdn_enabled = false

  default_node_pool {
    name            = var.cluster_default_node_pool_name
    node_count      = var.cluster_default_node_pool_node_count
    vm_size         = var.cluster_default_node_pool_vm_size
    os_disk_size_gb = var.cluster_default_node_pool_os_disk_size_gb
    vnet_subnet_id  = var.sub_aks_prod_id
  }

  azure_active_directory_role_based_access_control {
    managed                = true
    admin_group_object_ids = [azuread_group.example.id]
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  network_profile {
    network_plugin    = var.cluster_network_profile_network_plugin
    network_policy    = var.cluster_network_profile_network_policy
    load_balancer_sku = var.cluster_network_profile_load_balancer_sku
  }

  tags = {
    Environment = var.cluster_tag
  }
}


