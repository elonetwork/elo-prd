
variable "nsg_rules_aks" {
  type = map(object({
    nsr_name                 = string
    nsg_name                 = string
    nsr_priority              = number
    nsr_direction             = string
    nsr_access                = string
    nsr_protocol              = string 
    nsr_source_port_range    = string
    nsr_destination_port_range = string
    nsr_destination_port_ranges = list(string)
    nsr_source_address_prefix = string
    nsr_destination_address_prefix = string
  }))
}


variable "nsg_rules_agents" {
  type = map(object({
    nsr_name                 = string
    nsg_name                 = string
    nsr_priority              = number
    nsr_direction             = string
    nsr_access                = string
    nsr_protocol              = string 
    nsr_source_port_range    = string
    nsr_destination_port_range = string
    nsr_destination_port_ranges = list(string)
    nsr_source_address_prefix = string
    nsr_destination_address_prefix = string
  }))
}
