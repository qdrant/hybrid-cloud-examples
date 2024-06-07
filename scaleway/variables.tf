variable "prefix" {
  description = "The prefix for all resources"
  default     = "example"
  type        = string
}

variable "kubernetes_version" {
  description = "The version of the Kubernetes cluster."
  type        = string
  default     = "1.29.1"
}


variable "node_type" {
  description = "The commercial type of the pool instances. Instances with insufficient memory are not eligible (DEV1-S, PLAY2-PICO, STARDUST). external is a special node type used to provision from other Cloud providers."
  type        = string
  default     = "DEV1-M"
}

variable "pool_size" {
  description = "The size of the pool"
  type        = number
  default     = 1
}

variable "subnet_cidr" {
  description = "The IPv4 subnet to associate with the private network."
  type        = string
  default     = "192.168.0.0/22"
}

variable "region" {
  description = "The region that will be used as default value for all resources. (fr-par if none specified)"
  type        = string
  default     = "fr-par"
}

variable "secret_key" {
  description = "Scaleway secret key"
  type        = string
}

variable "access_key" {
  description = "Scaleway access key"
  type        = string
}

variable "project_id" {
  description = "Project ID"
  type        = string
}