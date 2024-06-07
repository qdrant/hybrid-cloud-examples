variable "prefix" {
  description = "The prefix for all resources"
  default     = "example"
  type        = string
}
variable "api_key" {
  description = "This is the Vultr API key"
  type        = string
}

variable "region" {
  description = "The region your VKE cluster will be deployed in"
  type        = string
  default     = "ewr"
}
variable "k8s_version" {
  description = "The version of your VKE cluster you want deployed"
  type        = string
  default     = "v1.30.0+1"
}

variable "node_pools_plan" {
  description = "The plan for the node pools in your VKE cluster"
  type        = string
  default     = "vc2-4c-8gb"
}

variable "node_count" {
  description = "The number of nodes in the VKE cluster"
  type        = number
  default     = 3
}
