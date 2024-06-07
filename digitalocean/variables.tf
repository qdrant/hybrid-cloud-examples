variable "prefix" {
  description = "The prefix for all resources"
  default     = "example"
  type        = string
}

variable "region" {
  type        = string
  description = "The location of the cluster"
  default     = "fra1"
}

variable "kubernetes_version_prefix" {
  type        = string
  description = "The Kubernetes version prefix to find latest version"
  default     = "1.29"
}

variable "node_count" {
  type        = number
  description = "The number of Droplet instances in the node pool."
  default     = 1
}

variable "size" {
  type        = string
  description = "The slug identifier for the type of Droplet to be used as workers in the node pool."
  default     = "s-4vcpu-8gb"
}

variable "do_token" {
  type        = string
  description = "Provide a token to access Digital Ocean"
}
