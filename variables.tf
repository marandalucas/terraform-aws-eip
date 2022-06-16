variable "vpc" {
  description = "Whether the EIP is in a VPC."
  type        = bool
  default     = true
}

variable "instance" {
  description = "Instance to associate with EIP."
  type        = string
  default     = null
}

variable "network_interface" {
  description = "ENI to associate with EIP."
  type        = string
  default     = null
}

variable "associate_with_private_ip" {
  description = "Private IP to associate with EIP."
  type        = string
  default     = null
}
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "public_ipv4_pool" {
  description = "IP pool to use (or 'amazon'.)"
  type        = string
  default     = "amazon"
}

