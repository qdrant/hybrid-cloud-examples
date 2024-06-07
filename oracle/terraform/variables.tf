variable "tenancy_ocid" {
  description = "The OCID of the tenancy"
  type        = string
}

variable "region" {
  description = "OCI region"
  type        = string
}

variable "user_ocid" {
  description = "The OCID of the user"
  type        = string
}

variable "fingerprint" {
  description = "The fingerprint for the user's API key"
  type        = string
}

variable "private_key_path" {
  description = "The path to the private key for API signing"
  type        = string
}

variable "oci_node_pool_node_shape" {
  description = "OCI Kubernetes node pool Shape (e.g. `VM.Standard2.1` => 1vCPU, 15GB RAM)"
  type        = string
}

variable "oci_node_pool_node_image_name" {
  description = "OCI Kubernetes node pool image name (e.g. `Oracle-Linux-7.6`)"
  type        = string
}

variable "oke_compartment_name" {
  description = "Name of the compartment for Oracle Kubernetes Engine"
  type        = string
}

variable "oke_compartment_description" {
  description = "Description of the compartment for Oracle Kubernetes Engine"
  type        = string
}

variable "oke_vcn_cidr_block" {
  description = "CIDR block for the VCN"
  type        = string
}

variable "oke_subnet1_cidr_block" {
  description = "CIDR block for OKE Subnet 1"
  type        = string
}

variable "oke_subnet2_cidr_block" {
  description = "CIDR block for OKE Subnet 2"
  type        = string
}

variable "nodepool_subnet1_cidr_block" {
  description = "CIDR block for Node Pool Subnet 1"
  type        = string
}

variable "nodepool_subnet2_cidr_block" {
  description = "CIDR block for Node Pool Subnet 2"
  type        = string
}

variable "cluster_name" {
  description = "Name of the OKE cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
}

variable "nodepool_name" {
  description = "Name of the node pool"
  type        = string
}

variable "nodepool_quantity_per_subnet" {
  description = "Quantity of nodes per subnet in the node pool"
  type        = number
}

variable "security_list_display_name" {
  description = "Display name for the security list"
  type        = string
}
