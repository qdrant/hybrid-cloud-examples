variable "env" {
  type = string
  default = "stg"
  description = "Environment sort name"
}

variable "region" {
  type = string
  description = "Google cloud region"
  default = "europe-west1"
}


variable "project_id" {
  type = string
  description = "Google cloud Project ID"
}

variable "network_name" {
  type        = string
  description = "Name of the VPC network"
  default = "qdrant-example"
}

variable "ssh_ingress_range" {
  type        = list(string)
  description = "List of CIDR range from which ssh will be allowed in the VPC"
  default     = []
  validation {
    condition = alltrue([
      for ip in var.ssh_ingress_range : can(cidrnetmask(ip))
    ])
    error_message = "All elements must be valid IPv4 CIDR block addresses."
  }
}

variable "nat_ip_count" {
  type        = number
  description = "Number of NAT IP for this VPC"
  default     = 3
}

variable "nat_ip_allocate_option" {
  type    = string
  default = "MANUAL_ONLY"
  description = "Dynamic or manual  NATs IPs allocation for cloud router"
}

variable "default_egress_route" {
  type = list(map(string))
  default = [
    {
      name              = "egress-internet"
      description       = "route through IGW to access internet"
      destination_range = "0.0.0.0/0"
      tags              = "egress-inet"
      next_hop_internet = "true"
    },
  ]
}


variable "auto_create_subnetworks" {
  type    = bool
  default = false
}

variable "firewall_rules" {
  type    = any
  default = []
}

variable "subnets" {
  type = list(object({
    subnet_name                      = string
    subnet_ip                        = string
    subnet_region                    = string
    subnet_private_access            = optional(string)
    subnet_private_ipv6_access       = optional(string)
    subnet_flow_logs                 = optional(string)
    subnet_flow_logs_interval        = optional(string)
    subnet_flow_logs_sampling        = optional(string)
    subnet_flow_logs_metadata        = optional(string)
    subnet_flow_logs_filter          = optional(string)
    subnet_flow_logs_metadata_fields = optional(list(string))
    description                      = optional(string)
    purpose                          = optional(string)
    role                             = optional(string)
    stack_type                       = optional(string)
    ipv6_access_type                 = optional(string)
  }))
  description = "The list of subnets being created"

  default = [
    {
      subnet_name               = "qdrant-subnet-01"
      subnet_ip                 = "172.23.0.0/20"
      subnet_region             = "europe-west1"
      subnet_flow_logs_interval = "INTERVAL_10_MIN"
      subnet_flow_logs_sampling = 0.7
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      subnet_flow_logs          = "false"
      subnet_private_access     = "true"
    }]
}

variable "secondary_ranges" {
  type    = map(list(object({ range_name = string, ip_cidr_range = string })))
  description = "Secondary ranges that will be used in some of the subnets"
  default = {}
}

variable "ingress_rules" {
  description = "List of ingress rules. This will be ignored if variable 'rules' is non-empty"
  default     = []
  type = list(object({
    name                    = string
    description             = optional(string, null)
    disabled                = optional(bool, null)
    priority                = optional(number, null)
    destination_ranges      = optional(list(string), [])
    source_ranges           = optional(list(string), [])
    source_tags             = optional(list(string))
    source_service_accounts = optional(list(string))
    target_tags             = optional(list(string))
    target_service_accounts = optional(list(string))

    allow = optional(list(object({
      protocol = string
      ports    = optional(list(string))
    })), [])
    deny = optional(list(object({
      protocol = string
      ports    = optional(list(string))
    })), [])
    log_config = optional(object({
      metadata = string
    }))
  }))
}

variable "egress_rules" {
  description = "List of egress rules. This will be ignored if variable 'rules' is non-empty"
  default     = []
  type = list(object({
    name                    = string
    description             = optional(string, null)
    disabled                = optional(bool, null)
    priority                = optional(number, null)
    destination_ranges      = optional(list(string), [])
    source_ranges           = optional(list(string), [])
    source_tags             = optional(list(string))
    source_service_accounts = optional(list(string))
    target_tags             = optional(list(string))
    target_service_accounts = optional(list(string))

    allow = optional(list(object({
      protocol = string
      ports    = optional(list(string))
    })), [])
    deny = optional(list(object({
      protocol = string
      ports    = optional(list(string))
    })), [])
    log_config = optional(object({
      metadata = string
    }))
  }))
}


### GKE


variable "cluster_name" {
  description = "GKE Cluster name"
  type        = string
  default     = "qdrant-hybrid-example"
}

variable "initial_node_count" {
  description = "The number of nodes to create in this cluster's node pool"
  type        = number
  default     = 1
}

variable "master_ipv4_cidr_block" {
  description = "The IP range in CIDR notation to use for the hosted master network. This range must not overlap with any other ranges in use within the cluster's network, and it must be a /28 subnet"
  type        = string
  default = "172.16.0.0/28"
}
variable "min_master_version" {
  description = "The minimum version of the master"
  type        = string
  default     = "1.27.8-gke.1067004"
}

variable "node_version" {
  description = "The Kubernetes version on the nodes. Must either be unset or set to the same value as min_master_version on create"
  type        = string
  default     = "1.27.8-gke.1067004"
}



variable "additional_node_pool" {
  type = map(
    object({
      min_node_count = number,
      max_node_count = number,
      machine_type   = string,
      image_type     = string,
      labels         = map(string),
      taint          = list(object({ key = string, value = string, effect = string })),
      preemptible    = string,
      spot           = string,
    })
  )

  default = {
    "gp-spot" = {
      min_node_count = 0,
      max_node_count = 7,
      machine_type   = "n1-standard-4",
      image_type     = "COS_CONTAINERD",
      labels = {
        purpose = "general",
        cores   = "c4"
      },
      taint       = [],
      preemptible = false,
      spot        = true,
    }
  }
}

variable "master_authorized_networks" {
  type    = list(any)
  description = "List of CIDRs allowd to connect to GKE cluster"
  default = []
}

variable "allowed_ips_to_k8s" {
  type = list(string)
  default = []
  description = "List of individual IPs allowd to connect GKE cluster"
}