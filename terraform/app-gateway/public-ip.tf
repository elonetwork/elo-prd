resource "azurerm_public_ip" "app_gateway_public_ip" {
  name                = join("_", [var.env_name, "app_gateway_public_ip"])
  resource_group_name = var.resource_group_name
  location            = var.location
  sku = "Standard"
  allocation_method   = "Static"
}
