variable "region" {
  description = "The region of the cluster"
  type        = string
  default     = "LON1"
}

variable "token" {
  description = "The Civo API key"
  type        = string
}

variable "prefix" {
  description = "The prefix for all resources"
  default     = "example"
  type        = string
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