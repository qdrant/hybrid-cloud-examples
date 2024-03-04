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

variable "ibmcloud_api_key" {
  type        = string
}

variable "iaas_classic_username" {
  type        = string
}

variable "iaas_classic_api_key" {
  type        = string
}
