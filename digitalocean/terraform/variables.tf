variable "vpc_name" {
  description = "Cluster name"
  type        = string
  default     = "qdrant-hybrid-example"
}

variable "vpc_cidr" {
  default     = "10.10.0.0/16"
  type        = string
  description = "CIDR renage for VPC"
}

variable "cluster_name" {
  description = "Cluster name"
  type        = string
  default     = "qdrant-hybrid-example"
}

variable "region" {
  type        = string
  description = "The location of the cluster"
  default     = "fra1"
}

variable "auto_upgrade" {
  type        = bool
  description = "Whether the cluster will be automatically upgraded"
  default     = true
}

variable "surge_upgrade" {
  type        = bool
  description = "Enable/disable surge upgrades for a cluster"
  default     = false
}

variable "tags" {
  description = "The list of instance tags applied to the cluster."
  type        = list(any)
  default     = ["qdrant"]
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

variable "min_nodes" {
  default     = 1
  type        = string
  description = "Autoscaling Minimum node capacity"
}

variable "auto_scale" {
  description = "Enable cluster autoscaling"
  type        = bool
  default     = true
}

variable "max_nodes" {
  default     = 9
  type        = string
  description = "Autoscaling maximum node capacity"
}

variable "node_labels" {
  description = "List of Kubernetes labels to apply to the nodes"
  type        = map(any)
  default = {
    "service" = "qdrant-example"
  }
}

variable "node_tags" {
  description = "The list of instance tags applied to all nodes."
  type        = list(any)
  default     = ["qdrant-example"]
}


variable "size" {
  type        = string
  description = "The slug identifier for the type of Droplet to be used as workers in the node pool."
  default     = "s-4vcpu-8gb"
}



variable "node_pools" {
  description = "Addons node pools"
  type = map(object({
    size        = string
    node_count  = number
    auto_scale  = bool
    min_nodes   = number
    max_nodes   = number
    node_tags   = list(string)
    node_labels = map(string)
  }))
  default = {}
}

variable "do_token" {
  type        = string
  description = "Provide a token to access Digital Ocean"
}
