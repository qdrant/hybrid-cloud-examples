variable "azure_subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}
variable "azure_client_id" {
  description = "The Azure client ID"
  type        = string
}
variable "azure_client_secret" {
  description = "The Azure client secret"
  type        = string
}
variable "azure_tenant_id" {
  description = "The Azure tenant ID"
  type        = string
}
variable "prefix" {
  description = "The prefix for all resources"
  default     = "example"
  type        = string
}
variable "azure_location" {
  type        = string
  description = "Azure location used for all resources"
  default     = "East US"
}
variable "instance_type" {
  type        = string
  description = "Instance type used for all nodes"
  default     = "Standard_DS2_v2"
}
variable "node_count" {
  description = "Node count"
  type        = string
  default     = 3
}