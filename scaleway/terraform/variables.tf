variable "cluster_name" {
  description = "The name for the Kubernetes cluster."
  type = string
  default = "qdrant-example"
}

variable "kubernetes_version" {
  description = "The version of the Kubernetes cluster."
  type = string
  default = "1.29.1"
}

variable "cni" {
  description = "The Container Network Interface (CNI) for the Kubernetes cluster."
  type = string
  default = "cilium"
}

variable "delete_additional_resources" {
  description = "Delete additional resources like block volumes, load-balancers and the cluster's private network (if empty) that were created in Kubernetes on cluster deletion. ~> Important: Setting this field to true means that you will lose all your cluster data and network configuration when you delete your cluster. If you prefer keeping it, you should instead set it as false."
  type = bool
  default = false
}

variable "node_type" {
  description = "The commercial type of the pool instances. Instances with insufficient memory are not eligible (DEV1-S, PLAY2-PICO, STARDUST). external is a special node type used to provision from other Cloud providers."
  type = string
  default = "DEV1-M"
}

variable "pool_size" {
  description = "The size of the pool"
  type = number
  default = 1
}

variable "tags" {
  description = "Resource tags"
  type = list(string)
  default = ["demo", "k8s", "terraform"]
}

variable "subnet_cidr" {
  description = "The IPv4 subnet to associate with the private network."
  type = string
  default = "192.168.0.0/22"
}

variable "region" {
  description = "The region that will be used as default value for all resources. (fr-par if none specified)"
  type = string
  default = "fr-par"
}

variable "secret_key" {
  description = "Scaleway secret key"
  type = string
}

variable "access_key" {
  description = "Scaleway access key"
  type = string
}

variable "project_id" {
  description = "Project ID"
  type = string
}