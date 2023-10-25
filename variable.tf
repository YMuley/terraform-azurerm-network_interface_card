variable "network_interface_card_list" {
  type        = list(any)
  default     = []
  description = "list of network security group objects "
}

variable "resource_group_output" {
  type        = map(any)
  default     = {}
  description = "list of resource group objects "
}

variable "subnet_output" {
  description = "Map of subnet output"
  type        = map(any)
  default     = {}
}

variable "public_ip_output" {
  type        = any
  default     = []
  description = "list of public ip objects"
}


variable "default_values" {
  type        = any
  default     = {}
  description = "Provide default values for resource if not any"
}
