variable "resource_group_name" {
  description = "Name of the resource group where the Application Gateway will be created."
}

variable "location" {
  description = "Azure region where the Application Gateway will be deployed."
}


variable "app_gateway_subnet_id" {
  description = "ID of the subnet where the Application Gateway should be deployed."
}

variable "frontend_port" {
  description = "Frontend port for the Application Gateway."
  default     = 80
}


variable "env_name" {
  description = "Prefix of the env (e.g prd, mgm)."
}

locals {
  backend_address_pool_name      = "${var.env_name}-beap"
  frontend_port_name             = "${var.env_name}-feport"
  frontend_ip_configuration_name = "${var.env_name}-feip"
  http_setting_name              = "${var.env_name}-be-htst"
  listener_name                  = "${var.env_name}-httplstn"
  request_routing_rule_name      = "${var.env_name}-rqrt"
  redirect_configuration_name    = "${var.env_name}-rdrcfg"
}
