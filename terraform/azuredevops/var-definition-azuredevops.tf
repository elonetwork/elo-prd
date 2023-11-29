variable "azdevopsscfile" {
  default = "azdevops.sh"
}

variable "prefix" {
  type        = string
  default = "devops"

}

variable "location" {
  type        = string
  default = "southcentralus"
}

variable "username" {
  type        = string
  description = "Username for virtual machine"
  default = "testadmin"
}

variable "password" {
  type        = string
  description = "Password for virtual machine"
  default = "Password@123"
}

variable "resourcegroupname" {
  type        = string
  description = "Resource group"
  default     = "1-edbb0a66-playground-sandbox"
}

variable "countofvms" {
  type        = number
  description = "no of agents to be created"
  default     = 1
}