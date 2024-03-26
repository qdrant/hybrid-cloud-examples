<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.18.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloud_router"></a> [cloud\_router](#module\_cloud\_router) | terraform-google-modules/cloud-router/google | 6.0.2 |
| <a name="module_firewall_rules"></a> [firewall\_rules](#module\_firewall\_rules) | terraform-google-modules/network/google//modules/firewall-rules | 9.0.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-google-modules/network/google | 9.0.0 |

## Resources

| Name | Type |
|------|------|
| [google_compute_address.nat_ips](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [google_container_cluster.gke](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster) | resource |
| [google_container_node_pool.additional](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Google cloud Project ID | `string` | n/a | yes |
| <a name="input_additional_node_pool"></a> [additional\_node\_pool](#input\_additional\_node\_pool) | n/a | <pre>map(<br>    object({<br>      min_node_count = number,<br>      max_node_count = number,<br>      machine_type   = string,<br>      image_type     = string,<br>      labels         = map(string),<br>      taint          = list(object({ key = string, value = string, effect = string })),<br>      preemptible    = string,<br>      spot           = string,<br>    })<br>  )</pre> | <pre>{<br>  "gp-spot": {<br>    "image_type": "COS_CONTAINERD",<br>    "labels": {<br>      "cores": "c4",<br>      "purpose": "general"<br>    },<br>    "machine_type": "n1-standard-4",<br>    "max_node_count": 7,<br>    "min_node_count": 0,<br>    "preemptible": false,<br>    "spot": true,<br>    "taint": []<br>  }<br>}</pre> | no |
| <a name="input_allowed_ips_to_k8s"></a> [allowed\_ips\_to\_k8s](#input\_allowed\_ips\_to\_k8s) | List of individual IPs allowd to connect GKE cluster | `list(string)` | `[]` | no |
| <a name="input_auto_create_subnetworks"></a> [auto\_create\_subnetworks](#input\_auto\_create\_subnetworks) | n/a | `bool` | `false` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | GKE Cluster name | `string` | `"qdrant-hybrid-example"` | no |
| <a name="input_default_egress_route"></a> [default\_egress\_route](#input\_default\_egress\_route) | n/a | `list(map(string))` | <pre>[<br>  {<br>    "description": "route through IGW to access internet",<br>    "destination_range": "0.0.0.0/0",<br>    "name": "egress-internet",<br>    "next_hop_internet": "true",<br>    "tags": "egress-inet"<br>  }<br>]</pre> | no |
| <a name="input_egress_rules"></a> [egress\_rules](#input\_egress\_rules) | List of egress rules. This will be ignored if variable 'rules' is non-empty | <pre>list(object({<br>    name                    = string<br>    description             = optional(string, null)<br>    disabled                = optional(bool, null)<br>    priority                = optional(number, null)<br>    destination_ranges      = optional(list(string), [])<br>    source_ranges           = optional(list(string), [])<br>    source_tags             = optional(list(string))<br>    source_service_accounts = optional(list(string))<br>    target_tags             = optional(list(string))<br>    target_service_accounts = optional(list(string))<br><br>    allow = optional(list(object({<br>      protocol = string<br>      ports    = optional(list(string))<br>    })), [])<br>    deny = optional(list(object({<br>      protocol = string<br>      ports    = optional(list(string))<br>    })), [])<br>    log_config = optional(object({<br>      metadata = string<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_env"></a> [env](#input\_env) | Environment sort name | `string` | `"stg"` | no |
| <a name="input_firewall_rules"></a> [firewall\_rules](#input\_firewall\_rules) | n/a | `any` | `[]` | no |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | List of ingress rules. This will be ignored if variable 'rules' is non-empty | <pre>list(object({<br>    name                    = string<br>    description             = optional(string, null)<br>    disabled                = optional(bool, null)<br>    priority                = optional(number, null)<br>    destination_ranges      = optional(list(string), [])<br>    source_ranges           = optional(list(string), [])<br>    source_tags             = optional(list(string))<br>    source_service_accounts = optional(list(string))<br>    target_tags             = optional(list(string))<br>    target_service_accounts = optional(list(string))<br><br>    allow = optional(list(object({<br>      protocol = string<br>      ports    = optional(list(string))<br>    })), [])<br>    deny = optional(list(object({<br>      protocol = string<br>      ports    = optional(list(string))<br>    })), [])<br>    log_config = optional(object({<br>      metadata = string<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_initial_node_count"></a> [initial\_node\_count](#input\_initial\_node\_count) | The number of nodes to create in this cluster's node pool | `number` | `1` | no |
| <a name="input_master_authorized_networks"></a> [master\_authorized\_networks](#input\_master\_authorized\_networks) | List of CIDRs allowd to connect to GKE cluster | `list(any)` | `[]` | no |
| <a name="input_master_ipv4_cidr_block"></a> [master\_ipv4\_cidr\_block](#input\_master\_ipv4\_cidr\_block) | The IP range in CIDR notation to use for the hosted master network. This range must not overlap with any other ranges in use within the cluster's network, and it must be a /28 subnet | `string` | `"172.16.0.0/28"` | no |
| <a name="input_min_master_version"></a> [min\_master\_version](#input\_min\_master\_version) | The minimum version of the master | `string` | `"1.27.8-gke.1067004"` | no |
| <a name="input_nat_ip_allocate_option"></a> [nat\_ip\_allocate\_option](#input\_nat\_ip\_allocate\_option) | Dynamic or manual  NATs IPs allocation for cloud router | `string` | `"MANUAL_ONLY"` | no |
| <a name="input_nat_ip_count"></a> [nat\_ip\_count](#input\_nat\_ip\_count) | Number of NAT IP for this VPC | `number` | `3` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Name of the VPC network | `string` | `"qdrant-example"` | no |
| <a name="input_node_version"></a> [node\_version](#input\_node\_version) | The Kubernetes version on the nodes. Must either be unset or set to the same value as min\_master\_version on create | `string` | `"1.27.8-gke.1067004"` | no |
| <a name="input_region"></a> [region](#input\_region) | Google cloud region | `string` | `"europe-west1"` | no |
| <a name="input_secondary_ranges"></a> [secondary\_ranges](#input\_secondary\_ranges) | Secondary ranges that will be used in some of the subnets | `map(list(object({ range_name = string, ip_cidr_range = string })))` | `{}` | no |
| <a name="input_ssh_ingress_range"></a> [ssh\_ingress\_range](#input\_ssh\_ingress\_range) | List of CIDR range from which ssh will be allowed in the VPC | `list(string)` | `[]` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | The list of subnets being created | <pre>list(object({<br>    subnet_name                      = string<br>    subnet_ip                        = string<br>    subnet_region                    = string<br>    subnet_private_access            = optional(string)<br>    subnet_private_ipv6_access       = optional(string)<br>    subnet_flow_logs                 = optional(string)<br>    subnet_flow_logs_interval        = optional(string)<br>    subnet_flow_logs_sampling        = optional(string)<br>    subnet_flow_logs_metadata        = optional(string)<br>    subnet_flow_logs_filter          = optional(string)<br>    subnet_flow_logs_metadata_fields = optional(list(string))<br>    description                      = optional(string)<br>    purpose                          = optional(string)<br>    role                             = optional(string)<br>    stack_type                       = optional(string)<br>    ipv6_access_type                 = optional(string)<br>  }))</pre> | <pre>[<br>  {<br>    "subnet_flow_logs": "false",<br>    "subnet_flow_logs_interval": "INTERVAL_10_MIN",<br>    "subnet_flow_logs_metadata": "INCLUDE_ALL_METADATA",<br>    "subnet_flow_logs_sampling": 0.7,<br>    "subnet_ip": "172.23.0.0/20",<br>    "subnet_name": "qdrant-subnet-01",<br>    "subnet_private_access": "true",<br>    "subnet_region": "europe-west1"<br>  }<br>]</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->