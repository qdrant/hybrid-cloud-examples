variable "cluster_name" {
  default = "qdrant-example"
}
variable "kubernetes_version" {
  default = "1.29.1"
}
variable "cni" {
  default = "cilium"
}
variable "delete_additional_resources" {
  default = false
}
variable "project_id" {
}

variable "node_type" {
  default = "DEV1-M"
}
variable "pool_size" {
  default = 1
}
variable "tags" {
  default = []
}

variable "subnet_cidr" {
  default = "192.168.0.0/22"
}

variable "region" {
  default = "fr-par"
}