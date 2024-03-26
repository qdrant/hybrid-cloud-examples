
variable "endpoint" {
  description = "The OVH Cloud API endpoint"
  default     = "ovh-eu"
  type        = string
}

variable "application_key" {
  description = "The OVH Cloud API application key"
  type        = string
}

variable "application_secret" {
  description = "The OVH Cloud API application secret"
  type        = string
}

variable "consumer_key" {
  description = "The OVH Cloud API consumer key"
  type        = string
}

variable "service_name" {
  description = "The OVH Cloud Project Service name"
  type        = string
}

variable "cluster_name" {
  description = "This Kubernetes cluster's name"
  type        = string
  default     = "qdrant-example"
}

variable "cluster_region" {
  description = "This Kubernetes cluster's location"
  type        = string
  default     = "DE1"
}

variable "node_flavor" {
  description = "The flavor of the nodes"
  type        = string
  default     = "b2-7"
}

variable "node_count" {
  description = "The number of nodes"
  type        = number
  default     = 3
}
variable "min_nodes" {
  description = "The minimum number of nodes"
  type        = number
  default     = 1
}
variable "max_nodes" {
  description = "The maximum number of nodes"
  type        = number
  default     = 3
}