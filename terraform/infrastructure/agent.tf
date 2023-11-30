resource "azurerm_network_interface" "main" {
  name                = "interface-agent"
  resource_group_name = var.resource_group_name
  location            = var.location

  ip_configuration {
    name                          = "in_ternal"
    subnet_id                     = module.sub-aks-agents.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "main" {
  name                            = "vm-agent-linux"
  resource_group_name             = var.resource_group_name
  location                        = var.location
  size                            = "Standard_DS1_v2"
  admin_username                  = var.username
  admin_password                  = var.password
  disable_password_authentication = false

  network_interface_ids = [azurerm_network_interface.main.id]

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
}