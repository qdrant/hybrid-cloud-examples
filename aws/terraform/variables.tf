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

variable "azs" {
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  type        = list(string)
  description = "AZs for VPC"
}

variable "private_subnets" {
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  type        = list(string)
  description = "private subnets CIDR renage for VPC"
}

variable "public_subnets" {
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  type        = list(string)
  description = "private subnets CIDR renage for VPC"
}

variable "tags" {
  type        = map(string)
  description = "Default tags"
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}


variable "cluster_name" {
  description = "Cluster name"
  type        = string
  default     = "qdrant-cluster-example"
}

variable "region" {
  type        = string
  description = "The location of the cluster"
  default     = "us-east-1"
}

variable "aws_profile_name" {
  type        = string
  description = "aws config profile name"
  default     = "my-profile"
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


variable "eks_access_entry" {

}