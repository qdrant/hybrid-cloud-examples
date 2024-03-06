variable "api_key" {
  description = "This is the Vultr API key"
  type        = string
}

variable "region" {
  description = "The region your VKE cluster will be deployed in"
  type        = string
  default     = "ewr"
}

variable "label" {
  description = "The VKE cluster's label."
  type        = string
  default     = "qdrant-example"
}

variable "k8s_version" {
  description = "The version of your VKE cluster you want deployed"
  type        = string
  default     = "v1.29.2+1"
}

variable "v_subnet" {
  description = "The virtual subnet for your VKE cluster"
  type        = string
  default     = "192.168.0.0"
}

variable "v4_subnet_mask" {
  description = "The subnet mask for the virtual subnet"
  type        = string
  default     = "22"
}

variable "node_pools_plan" {
  description = "The plan for the node pools in your VKE cluster"
  type        = string
  default     = "vc2-4c-8gb"
}

variable "auto_scaler" {
  description = "Enable or disable auto-scaling for the VKE cluster"
  type        = bool
  default     = true
}

variable "min_node" {
  description = "The minimum number of nodes in the VKE cluster"
  type        = number
  default     = 1
}

variable "max_node" {
  description = "The maximum number of nodes in the VKE cluster"
  type        = number
  default     = 10
}
