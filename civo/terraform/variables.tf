variable "region" {
  description = "The region of the cluster"
  type        = string
  default     = "LON1"
}

variable "token" {
  description = "This is the Linode API key"
  type        = string
}

variable "cluster_name" {
    description = "The name of the cluster"
    type        = string
    default     = "civo-k8s"
}

variable "node_size" {
    description = "The size of the nodes"
    type        = string
    default     = "g4s.kube.medium"
}

variable "node_count" {
    description = "Node count"
    type        = string
    default     = 3
}