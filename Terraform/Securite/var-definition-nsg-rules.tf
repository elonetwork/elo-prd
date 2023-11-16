
variable "resource_group_name" {
  type = string
}


variable "direction-outbound" {
  type = string
}
variable "value-etoile" {
  type = string
}
variable "name-nsg-https-allow-outbound-aks-prd" {
  type = string
}
variable "priority-100" {
  type = number
}
variable "access-allow" {
  type = string
}

variable "port-443" {
  type = string
}

variable "name-nsg-http-allow-outbound-aks-prd" {
 type=string 
}

variable "priority-110" {
  type = number
}

variable "protocol-tcp" {
  type = string
}

variable "port-80" {
  type = string
}

variable "direction-inbound" {
  type = string
}

variable "priority-1000" {
  type = number
}
/* 
variable "deny-tcp-allow-inbound-rule-aks-prd" {
  type = string
} */

/* variable "name-deny-tcp-inbound-rule-aks-prd" {
  type = string
}  */
variable "name-nsg-http-allow-inbound-aks-prd" {
  type = string
} 
variable "name-nsg-https-allow-inbound-aks-prd" {
  type = string
} 
variable "access-deny" {
  type = string
} 
variable "name-nsg-https-allow-inbound-appgtw-prd" {
  
}

variable "name-nsg-https-allow-outbound-appgtw-prd" {
  
}