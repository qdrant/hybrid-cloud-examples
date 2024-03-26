variable "region" {
  description = "The region of the VPC"
  type        = string
  default     = "us-iad"
}

variable "label" {
  description = "The label of the VPC. This field can only contain ASCII letters, digits and dashes."
  type        = string
  default     = "qdrant-example"
}

variable "v_subnet" {
  description = "The IPv4 range of this subnet in CIDR format."
  type        = string
  default     = "10.0.0.0/24"
}

variable "k8s_version" {
  description = "The desired Kubernetes version for this Kubernetes cluster in the format of major.minor (e.g. 1.21), and the latest supported patch version will be deployed."
  type        = string
  default     = "1.28"
}

variable "token" {
  description = "This is the Linode API key"
  type        = string
}

variable "cluster_region" {
  description = "This Kubernetes cluster's location"
  type        = string
  default     = "us-central"
}

variable "tags" {
  description = "An array of tags applied to the Kubernetes cluster. Tags are case-insensitive and are for organizational purposes only."
  type        = list(string)
  default     = ["qdrant"]
}

variable "pool_type" {
  description = "A Linode Type for all of the nodes in the Node Pool."
  type        = string
  default     = "g6-standard-2"
}

variable "min_pool_size" {
  description = "The minimum number of nodes to autoscale to."
  type        = number
  default     = 3
}

variable "max_pool_size" {
  description = "The maximum number of nodes to autoscale to."
  type        = number
  default     = 10
}

variable "pool_count" {
  description = "The number of nodes in the Node Pool. If undefined with an autoscaler the initial node count will equal the autoscaler minimum."
  type        = number
  default     = 3
}
