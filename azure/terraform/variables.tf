variable "tags" {
  type        = map(string)
  description = "Default tags"
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}

variable "resource_name" {
  description = "Resource name"
  type        = string
  default     = "qdrant-demo-test"
}

variable "cluster_name" {
  description = "Cluster name"
  type        = string
  default     = "qdrant-cluster-example"
}

variable "region" {
  type        = string
  description = "The location of the cluster"
  default     = "Germany West Central"
}

variable "vpc_name" {
  description = "Cluster name VPC"
  type        = string
  default     = "qdrant-hybrid-example-vpc"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  type        = string
  description = "CIDR renage for VPC"
}

variable "pod_cidr" {
  default     = "10.1.0.0/16"
  type        = string
  description = "CIDR renage for pods"
}

variable "service_cidr" {
  default     = "10.2.0.0/16"
  type        = string
  description = "CIDR renage for service"
}

variable "dns_service_ip" {
  default     = "10.2.0.100"
  type        = string
  description = "DNS IP"
}
variable "environment" {
  default     = "test"
  type        = string
  description = "ENV name"
}

variable "kubernetes_version" {
  type        = string
  description = "The Kubernetes version"
  default     = "1.28.5"
}

variable "network_plugin" {
  type        = string
  description = "You can choose \"kubenet(basic)\" or \"azure(advanced)\" refer https://learn.microsoft.com/en-us/azure/aks/concepts-network#kubenet-basic-networking"
  default     = "kubenet"
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

variable "max_nodes" {
  default     = 9
  type        = string
  description = "Autoscaling maximum node capacity"
}

variable "public_ssh_key" {
}
