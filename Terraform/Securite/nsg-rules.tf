/* module "deny-tcp-allow-inbound-rule-aks-prd" {
  source                      = "../Modules/module-nsr"
  name                        = var.deny-tcp-allow-inbound-rule-aks-prd
  priority                    = var.priority-1000
  direction                   = var.direction-inbound
  access                      = var.access-deny
  source_port_range           = var.value-etoile
  destination_port_range      = var.value-etoile
  source_address_prefix       = var.value-etoile
  destination_address_prefix  = var.value-etoile
  resource_group_name         = var.resource_group_name
  network_security_group_name = module.nsg_aks-prd.nsg-name
} */

module "nsg-https-allow-inbound-aks-prd" {
  source                      = "../Modules/module-nsr"
  name                        = var.name-nsg-https-allow-inbound-aks-prd
  priority                    = var.priority-100
  direction                   = var.direction-inbound
  access                      = var.access-allow
  protocol                    = var.protocol-tcp
  source_port_range           = var.value-etoile
  destination_port_range      = var.value-etoile
  source_address_prefix       = var.value-etoile
  destination_address_prefix  = var.value-etoile
  resource_group_name         = var.resource_group_name
  network_security_group_name = module.nsg_aks-prd.nsg-name
}
module "nsg-http-allow-inbound-aks-prd" {
  source                      = "../Modules/module-nsr"
  name                        = var.name-nsg-http-allow-inbound-aks-prd
  priority                    = var.priority-110
  direction                   = var.direction-inbound
  access                      = var.access-allow
  protocol                    = var.protocol-tcp
  source_port_range           = var.value-etoile
  destination_port_range      = var.port-80
  source_address_prefix       = var.value-etoile
  destination_address_prefix  = var.value-etoile
  resource_group_name         = var.resource_group_name
  network_security_group_name = module.nsg_aks-prd.nsg-name
} 

module "nsg-https-allow-outbound-aks-prd" {
  source                      = "../Modules/module-nsr"
  name                        = var.name-nsg-https-allow-outbound-aks-prd
  priority                    = var.priority-100
  direction                   = var.direction-outbound
  access                      = var.access-allow
  protocol                    = var.protocol-tcp
  source_port_range           = var.value-etoile
  destination_port_range      = var.port-443
  source_address_prefix       = var.value-etoile
  destination_address_prefix  = var.value-etoile
  resource_group_name         = var.resource_group_name
  network_security_group_name = module.nsg_aks-prd.nsg-name
}

module "nsg-http-allow-outbound-aks-prd" {
  source                      = "../Modules/module-nsr"
  name                        = var.name-nsg-http-allow-outbound-aks-prd
  priority                    = var.priority-110
  direction                   = var.direction-outbound
  access                      = var.access-allow
  protocol                    = var.protocol-tcp
  source_port_range           = var.value-etoile
  destination_port_range      = var.port-80
  source_address_prefix       = var.value-etoile
  destination_address_prefix  = var.value-etoile
  resource_group_name         = var.resource_group_name
  network_security_group_name = module.nsg_aks-prd.nsg-name
} 

module "nsg-https-allow-inbound-appgtw-prd" {
  source                      = "../Modules/module-nsr"
  name                        = var.name-nsg-https-allow-inbound-appgtw-prd
  priority                    = var.priority-100
  direction                   = var.direction-inbound
  access                      = var.access-allow
  protocol                    = var.value-etoile
  source_port_range           = var.value-etoile
  destination_port_range      = var.value-etoile
  source_address_prefix       = var.value-etoile
  destination_address_prefix  = var.value-etoile
  resource_group_name         = var.resource_group_name
  network_security_group_name = module.nsg-appgtw-prd.nsg-name
}
module "nsg-https-allow-outbound-appgtw-prd" {
  source                      = "../Modules/module-nsr"
  name                        = var.name-nsg-https-allow-outbound-appgtw-prd
  priority                    = var.priority-100
  direction                   = var.direction-outbound
  access                      = var.access-allow
  protocol                    = var.value-etoile
  source_port_range           = var.value-etoile
  destination_port_range      = var.value-etoile
  source_address_prefix       = var.value-etoile
  destination_address_prefix  = var.value-etoile
  resource_group_name         = var.resource_group_name
  network_security_group_name = module.nsg-appgtw-prd.nsg-name
}






/* module "deny-tcp-inbound-rule-aks-prd" {
  source                      = "../Modules/module-nsr"
  name                        = var.name-deny-tcp-inbound-rule-aks-prd
  priority                    = var.priority-1000
  direction                   = var.direction-outbound
  access                      = var.access-deny
  protocol                    = var.value-etoile
  source_port_range           = var.value-etoile
  destination_port_range      = var.value-etoile
  source_address_prefix       = var.value-etoile
  destination_address_prefix  = var.value-etoile
  resource_group_name         = var.resource_group_name
  network_security_group_name = module.nsg_aks-prd.nsg-name
} */
