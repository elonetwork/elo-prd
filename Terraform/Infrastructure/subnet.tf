module "subnet-aks" {
  source               = "../Modules/module-subnet"
  resource_group_name  = var.resource_group_name
  name                 = var.name-subnet-aks
  virtual_network_name = azurerm_virtual_network.vnet-prd.name
  address_prefixes     = var.address-prefixes-subnet-aks
}

module "subnet-appgtw" {
  source               = "../Modules/module-subnet"
  resource_group_name  = var.resource_group_name
  name                 = var.name-subnet-appgtw
  virtual_network_name = azurerm_virtual_network.vnet-prd.name
  address_prefixes     = var.address-prefixes-subnet-appgtw
}


