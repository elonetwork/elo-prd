module "nsg_aks-prd" {
  source              = "../Modules/module-nsg"
  name                = var.name-aks
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "nsg-appgtw-prd" {
  source              = "../Modules/module-nsg"
  name                = var.name-appgtw
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "assoss_subnet_bastion" {
  subnet_id                 = var.subnet-aks
  network_security_group_id = module.nsg_aks-prd.nsg-id
}

resource "azurerm_subnet_network_security_group_association" "assoss_subnet_squid" {
  subnet_id                 = var.subnet-appgtw
  network_security_group_id = module.nsg-appgtw-prd.nsg-id
}