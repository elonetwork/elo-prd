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
  name                = "saijiro.private.${var.location}.azmk8s.io"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "private-zone-vnet-link-hub" {
  name                  = "privatelink-vnet-link-hub"
  private_dns_zone_name = azurerm_private_dns_zone.private-zone.name
  resource_group_name   = var.resource_group_name
  virtual_network_id    = data.terraform_remote_state.hub-infra.outputs.vnet_hub_id
  registration_enabled  = true
}

resource "azurerm_private_dns_zone_virtual_network_link" "private-zone-vnet-link-prod" {
  name                  = "privatelink-vnet-link-prod"
  private_dns_zone_name = azurerm_private_dns_zone.private-zone.name
  resource_group_name   = var.resource_group_name
  virtual_network_id    = var.vnet_prod_id
  registration_enabled  = true
}

resource "azurerm_kubernetes_cluster" "aks-prd" {

  depends_on = [azurerm_private_dns_zone.private-zone]
  name                                = "aks-prd"
  location                            = var.location
  resource_group_name                 = var.resource_group_name
  dns_prefix                          = "sos"
  private_dns_zone_id                 = azurerm_private_dns_zone.private-zone.id
  private_cluster_enabled             = true
  private_cluster_public_fqdn_enabled = false

  default_node_pool {
    name            = "akspoolprd"
    node_count      = 2
    vm_size         = "Standard_B2s"
    os_disk_size_gb = 30
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
    network_plugin    = "azure"
    network_policy    = "azure"
    load_balancer_sku = "standard"
  }

  tags = {
    Environment = "Production"
  }
}


