output "appgateway_id" {
    value = azurerm_application_gateway.appgatwprd.id
}
output "appgateway_public_ip" {
    value = azurerm_public_ip.appgatw_public_ip.ip_address
}