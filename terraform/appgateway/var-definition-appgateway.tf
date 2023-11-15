variable "location" {
  description = "Location for the Virtual Network"
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
}
variable "appgatw_public_ip" {
  description = "Name of prod app gateway public ip"
  default     = "appgatw-public-ip"
}
variable "vnet_prod_name" {
  
}
variable "sub_appgatw_prod_id" {
  
}
variable "appgatw_prd_subnet_name" {
  description = "Name of prod app gateway subnet"
  default     = "appgatw_prd_subnet"
}
variable "appgatw_prd_subnet_address_space" {
  description = "Address space of prod app gateway subnet"
  default     = "10.101.2.0/24"
}

variable "appgatwprd" {
  description = "Name of prod app gateway"
  default     = "app-gtw-prd"
}