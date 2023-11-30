output "gateway_id" {
    value = azurerm_application_gateway.appgtw.id
}

output "agent_private_ip" {
  value = azurerm_network_interface.main.ip_configuration[0].private_ip_address
}
