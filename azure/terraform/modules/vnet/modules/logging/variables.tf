variable "resource_group_location" {
  default     = "" ## inserted value
  type        = string
  description = "Region of resource group"
}

variable "resource_group_name" {
  default     = "" ## inserted value
  type        = string
  description = "Name of resource group"
}

variable "environment" {
  default = "" ## inserted value
  type    = string
}
variable "name" {
  default = "" ## inserted value
  type    = string
}

variable "network_security_group_id" {
  default = "" ## inserted value
  type    = string
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)

  default = {
    tag1 = ""
    tag2 = ""
  }
}