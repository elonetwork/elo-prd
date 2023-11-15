output "subnet-aks-id" {
  value = module.subnet-aks.subnet_id
}

output "subnet-appgtw-id" {
  value = module.subnet-appgtw.subnet_id
}
output "vnet-prd-name" {
  value = azurerm_virtual_network.vnet-prd.name
}

output "vnet-prd-id" {
  value = azurerm_virtual_network.vnet-prd.id
}
