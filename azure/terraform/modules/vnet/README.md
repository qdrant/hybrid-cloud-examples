# Azure Virtual Network Terraform module

![squareops_avatar]

[squareops_avatar]: https://squareops.com/wp-content/uploads/2022/12/squareops-logo.png

### [SquareOps Technologies](https://squareops.com/) Your DevOps Partner for Accelerating cloud journey.

<br>
Terraform module to create Networking resources for workload deployment on Azure Cloud.

## Usage Example

```hcl
module "vnet" {
  source                                          = "squareops/vnet/azurerm"
  name                                            = "skaf"
  address_space                                   = "10.0.0.0/16"
  environment                                     = "production"
  zones                                           = 2
  create_vnet                                     = true
  create_public_subnets                           = true
  create_private_subnets                          = true
  create_database_subnets                         = true
  create_nat_gateway                              = true
  num_public_subnets                              = "1"
  num_private_subnets                             = "1"
  num_database_subnets                            = "1"
  create_vpn                                      = true
  logging_enabled                                 = true
  address_subnets_database                        = ["10.0.1.0/24"]
  address_subnets_private                         = ["10.0.2.0/24"]
  address_subnets_public                          = ["10.0.3.0/24"]
}
```
Refer [examples](https://github.com/squareops/terraform-azure-vnet/tree/main/examples) for more details.

## Important Note
To prevent destruction interruptions, any resources that have been created outside of Terraform and attached to the resources provisioned by Terraform must be deleted before the module is destroyed.

## Network Scenarios

Users need to declare `address_space` and subnets are calculated with the help of in-built functions.

This module supports three scenarios to create Virtual Network resources on Azure. Each will be explained in brief in the corresponding sections.

- **simple-vnet (default behavior):** To create a VNet with public subnets and Internet Route Hop.
  - `create_vnet       = true`
  - `create_public_subnets = true`
  - `num_public_subnets    = true`
- **vnet-with-private-subnet:** To create a VNet with public subnets, private subnets, Internet Route Hop and NAT gateway. Database and Private, whichever subnets are enabled, are associated with the NAT gateway.
  - `create_vnet       = true`
  - `create_public_subnets = true`
  - `num_public_subnets    = true`
  - `create_private_subnets = true`
  - `num_private_subnets    = true`
  - `create_nat_gateway = true`
  - `create_vpn        = true`
- **complete-vnet-logging:** To create a VNet with public subnets, private subnets, database subnets, VPN, logging and NAT gateway. Database and Private, whichever subnets are enabled, are associated with the NAT gateway.
  - `create_vnet             = true`
  - `create_public_subnets   = true`
  - `num_public_subnets    = true`
  - `create_private_subnets  = true`
  - `num_private_subnets    = true`
  - `create_database_subnets = true`
  - `num_database_subnets    = true`
  - `create_nat_gateway      = true`
  - `logging_enabled          = true`
  - `create_vpn              = true`

# IAM Permissions
The required IAM permissions to create resources from this module can be found [here](https://github.com/squareops/terraform-azurerm-vnet/blob/release/v1/roles.md)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.11.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_logging"></a> [logging](#module\_logging) | ./modules/logging | n/a |
| <a name="module_nat_gateway"></a> [nat\_gateway](#module\_nat\_gateway) | ./modules/nat-gateway | n/a |
| <a name="module_network_security_group"></a> [network\_security\_group](#module\_network\_security\_group) | Azure/network-security-group/azurerm | 4.1.0 |
| <a name="module_resource-group"></a> [resource-group](#module\_resource-group) | ./modules/resource-group | n/a |
| <a name="module_routetable_database"></a> [routetable\_database](#module\_routetable\_database) | ./modules/routetable | n/a |
| <a name="module_routetable_private"></a> [routetable\_private](#module\_routetable\_private) | ./modules/routetable | n/a |
| <a name="module_routetable_public"></a> [routetable\_public](#module\_routetable\_public) | ./modules/routetable | n/a |
| <a name="module_vnet"></a> [vnet](#module\_vnet) | Azure/vnet/azurerm | 4.1.0 |
| <a name="module_vpn"></a> [vpn](#module\_vpn) | ./modules/vpn | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tags"></a> [additional\_tags](#input\_additional\_tags) | The tags to associate with your network and subnets. | `map(string)` | <pre>{<br>  "tag1": "",<br>  "tag2": ""<br>}</pre> | no |
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The address space CIDR that is used by the VNet. | `string` | `"10.0.0.0/16"` | no |
| <a name="input_address_subnets_database"></a> [address\_subnets\_database](#input\_address\_subnets\_database) | Database subnet CIDRs. If left empty, it is calculated automatically using num\_database\_subnets and VNet address space. | `list(any)` | `[]` | no |
| <a name="input_address_subnets_private"></a> [address\_subnets\_private](#input\_address\_subnets\_private) | Private subnet CIDRs. If left empty, it is calculated automatically using num\_private\_subnets and VNet address space. | `list(any)` | `[]` | no |
| <a name="input_address_subnets_public"></a> [address\_subnets\_public](#input\_address\_subnets\_public) | Public subnet CIDRs. If left empty, it is calculated automatically using num\_public\_subnets and VNet address space. | `list(any)` | `[]` | no |
| <a name="input_create_database_subnets"></a> [create\_database\_subnets](#input\_create\_database\_subnets) | Set to true to create database subnets | `bool` | `false` | no |
| <a name="input_create_nat_gateway"></a> [create\_nat\_gateway](#input\_create\_nat\_gateway) | Set to true to create a NAT Gateway | `bool` | `false` | no |
| <a name="input_create_network_security_group"></a> [create\_network\_security\_group](#input\_create\_network\_security\_group) | Set to true to create a network security group | `bool` | `true` | no |
| <a name="input_create_private_subnets"></a> [create\_private\_subnets](#input\_create\_private\_subnets) | Set to true to create private subnets | `bool` | `true` | no |
| <a name="input_create_public_ip"></a> [create\_public\_ip](#input\_create\_public\_ip) | Set to true to create a public IP for NAT Gateway | `bool` | `true` | no |
| <a name="input_create_public_subnets"></a> [create\_public\_subnets](#input\_create\_public\_subnets) | Set to true to create public subnets | `bool` | `true` | no |
| <a name="input_create_resource_group"></a> [create\_resource\_group](#input\_create\_resource\_group) | To create a new resource group. Value in existing\_resource\_group will be ignored if this is true. | `bool` | `true` | no |
| <a name="input_create_vnet"></a> [create\_vnet](#input\_create\_vnet) | Controls if VNet should be created (it affects all resources) | `bool` | `true` | no |
| <a name="input_create_vpn"></a> [create\_vpn](#input\_create\_vpn) | Set to true to create a VPN which is configured with Printul Server and deployed in public subnet | `bool` | `true` | no |
| <a name="input_custom_nsg_rules"></a> [custom\_nsg\_rules](#input\_custom\_nsg\_rules) | Rules for Network Security Group | `list(any)` | `[]` | no |
| <a name="input_ddos_protection_plan"></a> [ddos\_protection\_plan](#input\_ddos\_protection\_plan) | The set of DDoS protection plan configuration | <pre>object({<br>    enable = bool<br>    id     = string<br>  })</pre> | `null` | no |
| <a name="input_disable_bgp_route_propagation_database"></a> [disable\_bgp\_route\_propagation\_database](#input\_disable\_bgp\_route\_propagation\_database) | Boolean flag which controls propagation of routes learned by BGP on that route table. True means disable. | `string` | `"true"` | no |
| <a name="input_disable_bgp_route_propagation_private"></a> [disable\_bgp\_route\_propagation\_private](#input\_disable\_bgp\_route\_propagation\_private) | Boolean flag which controls propagation of routes learned by BGP on that route table. True means disable. | `string` | `"true"` | no |
| <a name="input_disable_bgp_route_propagation_public"></a> [disable\_bgp\_route\_propagation\_public](#input\_disable\_bgp\_route\_propagation\_public) | Boolean flag which controls propagation of routes learned by BGP on that route table. True means disable. | `string` | `"true"` | no |
| <a name="input_enable_logging"></a> [enable\_logging](#input\_enable\_logging) | To enable Logging for VNET | `string` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | # GENERAL VARIABLES | `string` | `"test"` | no |
| <a name="input_existing_resource_group_name"></a> [existing\_resource\_group\_name](#input\_existing\_resource\_group\_name) | Name of existing resource group that has to be used. Leave empty if new resource group has to be created. | `string` | `""` | no |
| <a name="input_generate_admin_ssh_key"></a> [generate\_admin\_ssh\_key](#input\_generate\_admin\_ssh\_key) | Set to true generate a SSH Key for VPN Server | `bool` | `true` | no |
| <a name="input_linux_distribution_name"></a> [linux\_distribution\_name](#input\_linux\_distribution\_name) | Variable to pick an OS flavour for Linux based VM. Possible values include: ubuntu1604, ubuntu1804, ubuntu1904, ubuntu2004, ubuntu2004-gen2,centos77, centos78-gen2, centos79-gen2, centos81, centos81-gen2, centos82-gen2, centos83-gen2,centos84-gen2 | `string` | `"ubuntu2004"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"skaf"` | no |
| <a name="input_nat_gateway_idle_timeout"></a> [nat\_gateway\_idle\_timeout](#input\_nat\_gateway\_idle\_timeout) | Idle timeout configuration in minutes for Nat Gateway | `number` | `4` | no |
| <a name="input_num_database_subnets"></a> [num\_database\_subnets](#input\_num\_database\_subnets) | Number of Database Subnets to be created by the VNet | `number` | `1` | no |
| <a name="input_num_private_subnets"></a> [num\_private\_subnets](#input\_num\_private\_subnets) | Number of private Subnets to be created by the VNet (Set | `number` | `1` | no |
| <a name="input_num_public_subnets"></a> [num\_public\_subnets](#input\_num\_public\_subnets) | Number of Public Subnets to be created by the VNet | `number` | `1` | no |
| <a name="input_os_flavor"></a> [os\_flavor](#input\_os\_flavor) | OS Flavor of the VPN Server. Set to linux always | `string` | `"linux"` | no |
| <a name="input_public_ip_availability_zone_vpn"></a> [public\_ip\_availability\_zone\_vpn](#input\_public\_ip\_availability\_zone\_vpn) | The availability zone to allocate the Public IP in. Possible values are `Zone-Redundant`, `1`,`2`, `3`, and `No-Zone` | `list(any)` | `[]` | no |
| <a name="input_public_ip_domain_name_label"></a> [public\_ip\_domain\_name\_label](#input\_public\_ip\_domain\_name\_label) | DNS domain label for NAT Gateway public IP. | `string` | `null` | no |
| <a name="input_public_ip_ids"></a> [public\_ip\_ids](#input\_public\_ip\_ids) | List of public ips to use in case a public IP for NAT Gateway is not being created. | `list(string)` | `[]` | no |
| <a name="input_public_ip_reverse_fqdn"></a> [public\_ip\_reverse\_fqdn](#input\_public\_ip\_reverse\_fqdn) | Reverse FQDN for NAT Gateway public IP. | `string` | `null` | no |
| <a name="input_public_ip_zones"></a> [public\_ip\_zones](#input\_public\_ip\_zones) | Public ip Zones to configure for NAT Gateway. | `list(string)` | `null` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Region od deployment | `string` | `"eastus"` | no |
| <a name="input_route_names_database"></a> [route\_names\_database](#input\_route\_names\_database) | A list of database subnets inside the vNet. | `list` | `[]` | no |
| <a name="input_route_names_private"></a> [route\_names\_private](#input\_route\_names\_private) | A list of public subnets inside the vNet. | `list` | `[]` | no |
| <a name="input_route_names_public"></a> [route\_names\_public](#input\_route\_names\_public) | A list of public subnets inside the vNet. | `list` | `[]` | no |
| <a name="input_route_nexthop_types_database"></a> [route\_nexthop\_types\_database](#input\_route\_nexthop\_types\_database) | The type of Azure hop the packet should be sent to for each corresponding route.Valid values are 'VirtualNetworkGateway', 'VnetLocal', 'Internet', 'HyperNetGateway', 'None' | `list` | `[]` | no |
| <a name="input_route_nexthop_types_private"></a> [route\_nexthop\_types\_private](#input\_route\_nexthop\_types\_private) | The type of Azure hop the packet should be sent to for each corresponding route.Valid values are 'VirtualNetworkGateway', 'VnetLocal', 'Internet', 'HyperNetGateway', 'None' | `list` | `[]` | no |
| <a name="input_route_nexthop_types_public"></a> [route\_nexthop\_types\_public](#input\_route\_nexthop\_types\_public) | The type of Azure hop the packet should be sent to for each corresponding route.Valid values are 'VirtualNetworkGateway', 'VnetLocal', 'Internet', 'HyperNetGateway', 'None' | `list` | `[]` | no |
| <a name="input_route_prefixes_database"></a> [route\_prefixes\_database](#input\_route\_prefixes\_database) | The list of address prefixes to use for each route. | `list` | `[]` | no |
| <a name="input_route_prefixes_private"></a> [route\_prefixes\_private](#input\_route\_prefixes\_private) | The list of address prefixes to use for each route. | `list` | `[]` | no |
| <a name="input_route_prefixes_public"></a> [route\_prefixes\_public](#input\_route\_prefixes\_public) | The list of address prefixes to use for each route. | `list` | `[]` | no |
| <a name="input_source_address_prefix"></a> [source\_address\_prefix](#input\_source\_address\_prefix) | n/a | `list(string)` | `[]` | no |
| <a name="input_subnet_names_database"></a> [subnet\_names\_database](#input\_subnet\_names\_database) | Name of the database subnets. If left empty, it is created automatically using name and environment variables. | `list(any)` | `[]` | no |
| <a name="input_subnet_names_private"></a> [subnet\_names\_private](#input\_subnet\_names\_private) | Name of the private subnets. If left empty, it is created automatically using name and environment variables. | `list(any)` | `[]` | no |
| <a name="input_subnet_names_public"></a> [subnet\_names\_public](#input\_subnet\_names\_public) | Name of the public subnets. If left empty, it is created automatically using name and environment variables. | `list(any)` | `[]` | no |
| <a name="input_virtual_machine_size"></a> [virtual\_machine\_size](#input\_virtual\_machine\_size) | The Virtual Machine SKU for the Virtual Machine, Default is Standard\_A2\_V2 | `string` | `"Standard_A2_v2"` | no |
| <a name="input_vpn_nsg_rules"></a> [vpn\_nsg\_rules](#input\_vpn\_nsg\_rules) | Rules to be added to the Network Security Group for the VPN Server | `list(any)` | <pre>[<br>  {<br>    "access": "Allow",<br>    "destination_port_range": "22",<br>    "direction": "Inbound",<br>    "name": "VPNSSHInboundRule",<br>    "priority": 1001,<br>    "protocol": "*",<br>    "source_address_prefix": "*",<br>    "source_port_range": "*"<br>  }<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_VPN_Public_IP"></a> [VPN\_Public\_IP](#output\_VPN\_Public\_IP) | Public IP for the VPN Server |
| <a name="output_database_subnets"></a> [database\_subnets](#output\_database\_subnets) | Database subnet IDs |
| <a name="output_database_subnets_cidr"></a> [database\_subnets\_cidr](#output\_database\_subnets\_cidr) | Database subnet CIDRs |
| <a name="output_nat_gateway_id"></a> [nat\_gateway\_id](#output\_nat\_gateway\_id) | Nat Gateway Id |
| <a name="output_nat_gateway_name"></a> [nat\_gateway\_name](#output\_nat\_gateway\_name) | Nat gateway Name |
| <a name="output_nat_gateway_public_ips"></a> [nat\_gateway\_public\_ips](#output\_nat\_gateway\_public\_ips) | Public IP associated wth the Nat Gateway |
| <a name="output_network_security_group_id"></a> [network\_security\_group\_id](#output\_network\_security\_group\_id) | The id of newly created network security group |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | Database subnet IDs |
| <a name="output_private_subnets_cidr"></a> [private\_subnets\_cidr](#output\_private\_subnets\_cidr) | Private subnet CIDRs |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | Database subnet IDs |
| <a name="output_public_subnets_cidr"></a> [public\_subnets\_cidr](#output\_public\_subnets\_cidr) | Public subnet CIDRs |
| <a name="output_resource_group_location"></a> [resource\_group\_location](#output\_resource\_group\_location) | Resource Group Name Location |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource Group Name |
| <a name="output_route_table_id_database"></a> [route\_table\_id\_database](#output\_route\_table\_id\_database) | The id of the newly created Route Table for Databases |
| <a name="output_route_table_id_private"></a> [route\_table\_id\_private](#output\_route\_table\_id\_private) | The id of the newly created Route Table |
| <a name="output_route_table_id_public"></a> [route\_table\_id\_public](#output\_route\_table\_id\_public) | The id of the newly created Route Table |
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | n/a |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | The Name of the newly created vNet |
| <a name="output_vnet_subnets_name_id"></a> [vnet\_subnets\_name\_id](#output\_vnet\_subnets\_name\_id) | Can be queried subnet-id by subnet name by using lookup(module.vnet.vnet\_subnets\_name\_id, subnet1) |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

Apache License, Version 2.0, January 2004 (https://www.apache.org/licenses/LICENSE-2.0)

## Support Us

To support our GitHub project by liking it, you can follow these steps:

  1. Click the "Star" button: On the repository page, you'll see a "Star" button in the upper right corner. Clicking on it will star the repository, indicating your support for the project.

  2. Optionally, you can also leave a comment on the repository or open an issue to give feedback or suggest changes.

Staring a repository on GitHub is a simple way to show your support and appreciation for the project. It also helps to increase the visibility of the project and make it more discoverable to others.

## Who we are

We believe that the key to success in the digital age is the ability to deliver value quickly and reliably. That’s why we offer a comprehensive range of DevOps & Cloud services designed to help your organization optimize its systems & Processes for speed and agility.

  1. We are an AWS Advanced consulting partner which reflects our deep expertise in AWS Cloud and helping 100+ clients over the last 5 years.
  2. Expertise in Kubernetes and overall container solution helps companies expedite their journey by 10X.
  3. Infrastructure Automation is a key component to the success of our Clients and our Expertise helps deliver the same in the shortest time.
  4. DevSecOps as a service to implement security within the overall DevOps process and helping companies deploy securely and at speed.
  5. Platform engineering which supports scalable,Cost efficient infrastructure that supports rapid development, testing, and deployment.
  6. 24*7 SRE service to help you Monitor the state of your infrastructure and eradicate any issue within the SLA.

We provide [support](https://squareops.com/contact-us/) on all of our projects, no matter how small or large they may be.

To find more information about our company, visit [squareops.com](https://squareops.com/), follow us on [Linkedin](https://www.linkedin.com/company/squareops-technologies-pvt-ltd/), or fill out a [job application](https://squareops.com/careers/). If you have any questions or would like assistance with your cloud strategy and implementation, please don't hesitate to [contact us](https://squareops.com/contact-us/).