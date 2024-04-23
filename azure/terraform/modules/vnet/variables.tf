## GENERAL VARIABLES
variable "environment" {
  default = "test" ## inserted value
  type    = string
}
variable "name" {
  default = "skaf" ## inserted value
  type    = string
}
variable "create_resource_group" {
  description = "To create a new resource group. Value in existing_resource_group will be ignored if this is true."
  type        = bool
  default     = true
}
variable "existing_resource_group_name" {
  description = "Name of existing resource group that has to be used. Leave empty if new resource group has to be created."
  type        = string
  default     = ""
}
variable "resource_group_location" {
  description = "Region od deployment"
  default     = "eastus" ## inserted value
  type        = string
}
variable "additional_tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)

  default = {
    tag1 = ""
    tag2 = ""
  }
}

## VNET VARIABLES
variable "create_vnet" {
  description = "Controls if VNet should be created (it affects all resources)"
  type        = bool
  default     = true
}
variable "address_space" {
  type        = string
  description = "The address space CIDR that is used by the VNet."
  default     = "10.0.0.0/16"
}
variable "ddos_protection_plan" {
  description = "The set of DDoS protection plan configuration"
  type = object({
    enable = bool
    id     = string
  })
  default = null
}

## SUBNET VARIABLES
variable "create_public_subnets" {
  description = "Set to true to create public subnets"
  type        = bool
  default     = true
}
variable "num_public_subnets" {
  description = "Number of Public Subnets to be created by the VNet"
  default     = 1
  type        = number
}
variable "address_subnets_public" {
  description = "Public subnet CIDRs. If left empty, it is calculated automatically using num_public_subnets and VNet address space."
  default     = []
  type        = list(any)
}
variable "subnet_names_public" {
  description = "Name of the public subnets. If left empty, it is created automatically using name and environment variables."
  default     = []
  type        = list(any)
}
variable "create_private_subnets" {
  description = "Set to true to create private subnets"
  type        = bool
  default     = true
}
variable "num_private_subnets" {
  description = "Number of private Subnets to be created by the VNet (Set "
  default     = 1
  type        = number
}
variable "address_subnets_private" {
  description = "Private subnet CIDRs. If left empty, it is calculated automatically using num_private_subnets and VNet address space."
  default     = []
  type        = list(any)
}
variable "subnet_names_private" {
  description = "Name of the private subnets. If left empty, it is created automatically using name and environment variables."
  default     = []
  type        = list(any)
}
variable "create_database_subnets" {
  description = "Set to true to create database subnets"
  type        = bool
  default     = false
}
variable "num_database_subnets" {
  description = "Number of Database Subnets to be created by the VNet"
  default     = 1
  type        = number
}
variable "address_subnets_database" {
  description = "Database subnet CIDRs. If left empty, it is calculated automatically using num_database_subnets and VNet address space."
  default     = []
  type        = list(any)
}
variable "subnet_names_database" {
  description = "Name of the database subnets. If left empty, it is created automatically using name and environment variables."
  default     = []
  type        = list(any)
}

## ROUTE TABLE VARIABLES
variable "route_prefixes_public" {
  description = "The list of address prefixes to use for each route."
  default     = []
}
variable "route_names_public" {
  description = "A list of public subnets inside the vNet."
  default     = []
}
variable "route_nexthop_types_public" {
  description = "The type of Azure hop the packet should be sent to for each corresponding route.Valid values are 'VirtualNetworkGateway', 'VnetLocal', 'Internet', 'HyperNetGateway', 'None'"
  default     = []
}
variable "disable_bgp_route_propagation_public" {
  description = "Boolean flag which controls propagation of routes learned by BGP on that route table. True means disable."
  default     = "true"
}
variable "route_prefixes_private" {
  description = "The list of address prefixes to use for each route."
  default     = []
}
variable "route_names_private" {
  description = "A list of public subnets inside the vNet."
  default     = []
}
variable "route_nexthop_types_private" {
  description = "The type of Azure hop the packet should be sent to for each corresponding route.Valid values are 'VirtualNetworkGateway', 'VnetLocal', 'Internet', 'HyperNetGateway', 'None'"
  default     = []
}
variable "disable_bgp_route_propagation_private" {
  description = "Boolean flag which controls propagation of routes learned by BGP on that route table. True means disable."
  default     = "true"
}
variable "route_prefixes_database" {
  description = "The list of address prefixes to use for each route."
  default     = []
}
variable "route_names_database" {
  description = "A list of database subnets inside the vNet."
  default     = []
}
variable "route_nexthop_types_database" {
  description = "The type of Azure hop the packet should be sent to for each corresponding route.Valid values are 'VirtualNetworkGateway', 'VnetLocal', 'Internet', 'HyperNetGateway', 'None'"
  default     = []
}
variable "disable_bgp_route_propagation_database" {
  description = "Boolean flag which controls propagation of routes learned by BGP on that route table. True means disable."
  default     = "true"
}

## NETWORK SECURITY GROUP VARIABLES
variable "create_network_security_group" {
  description = "Set to true to create a network security group"
  type        = bool
  default     = true
}
variable "source_address_prefix" {
  default = [] ## inserted value
  type    = list(string)
}
variable "custom_nsg_rules" {
  type        = list(any)
  default     = []
  description = "Rules for Network Security Group"
}

## NAT GATEWAY VARIABLES
variable "create_nat_gateway" {
  description = "Set to true to create a NAT Gateway"
  type        = bool
  default     = false
}
variable "create_public_ip" {
  description = "Set to true to create a public IP for NAT Gateway"
  type        = bool
  default     = true
}
variable "public_ip_zones" {
  description = "Public ip Zones to configure for NAT Gateway."
  type        = list(string)
  default     = null
}
variable "public_ip_ids" {
  description = "List of public ips to use in case a public IP for NAT Gateway is not being created."
  type        = list(string)
  default     = []
}
variable "public_ip_domain_name_label" {
  description = "DNS domain label for NAT Gateway public IP."
  type        = string
  default     = null
}
variable "public_ip_reverse_fqdn" {
  description = "Reverse FQDN for NAT Gateway public IP."
  type        = string
  default     = null
}
variable "nat_gateway_idle_timeout" {
  description = "Idle timeout configuration in minutes for Nat Gateway"
  type        = number
  default     = 4
}

## LOGGING VARIABLES
variable "logging_enabled" {
  description = "To enable Logging for VNET"
  type        = string
  default     = true
}

## VPN VARIABLES
variable "create_vpn" {
  description = "Set to true to create a VPN which is configured with Printul Server and deployed in public subnet"
  type        = bool
  default     = true
}
variable "os_flavor" {
  description = "OS Flavor of the VPN Server. Set to linux always"
  type        = string
  default     = "linux"
}
variable "linux_distribution_name" {
  description = "Variable to pick an OS flavour for Linux based VM. Possible values include: ubuntu1604, ubuntu1804, ubuntu1904, ubuntu2004, ubuntu2004-gen2,centos77, centos78-gen2, centos79-gen2, centos81, centos81-gen2, centos82-gen2, centos83-gen2,centos84-gen2"
  type        = string
  default     = "ubuntu2004"
}
variable "virtual_machine_size" {
  description = "The Virtual Machine SKU for the Virtual Machine, Default is Standard_A2_V2"
  type        = string
  default     = "Standard_A2_v2"
}
variable "generate_admin_ssh_key" {
  description = "Set to true generate a SSH Key for VPN Server"
  type        = bool
  default     = true
}
variable "vpn_nsg_rules" {
  description = "Rules to be added to the Network Security Group for the VPN Server"
  type        = list(any)
  default = [
    {
      name                   = "VPNSSHInboundRule"
      priority               = 1001
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "*"
      source_port_range      = "*"
      destination_port_range = "22"
      source_address_prefix  = "*"
    }
  ]
}
variable "public_ip_availability_zone_vpn" {
  description = "The availability zone to allocate the Public IP in. Possible values are `Zone-Redundant`, `1`,`2`, `3`, and `No-Zone`"
  type        = list(any)
  default     = []
}