module "resource-group" {
  source                  = "./modules/resource-group"
  count                   = var.create_resource_group ? 1 : 0
  resource_group_name     = format("%s-%s-resource-group", var.environment, var.name)
  resource_group_location = var.resource_group_location
  tags                    = local.additional_tags
}

module "vnet" {
  count                = var.create_vnet ? 1 : 0
  source               = "Azure/vnet/azurerm"
  version              = "4.1.0"
  depends_on           = [module.resource-group]
  resource_group_name  = var.create_resource_group == false ? var.existing_resource_group_name : module.resource-group[0].resource_group_name
  use_for_each         = true
  address_space        = [var.address_space]
  vnet_name            = format("%s-%s-vnet", var.environment, var.name)
  subnet_prefixes      = concat(local.public_subnets, local.private_subnets, local.database_subnets)
  subnet_names         = concat(local.subnet_names_public, local.subnet_names_private, local.subnet_names_database)
  vnet_location        = var.resource_group_location
  ddos_protection_plan = var.ddos_protection_plan

  route_tables_ids = merge(
    (var.create_public_subnets ? (length(local.subnet_names_public) > 0 ? { for subnet_name in local.subnet_names_public : subnet_name => "${module.routetable_public[0].routetable_id}" } : null) : null),
    (var.create_private_subnets ? (length(local.subnet_names_private) > 0 ? { for subnet_name in local.subnet_names_private : subnet_name => "${module.routetable_private[0].routetable_id}" } : null) : null),
    (var.create_database_subnets ? (length(local.subnet_names_database) > 0 ? { for subnet_name in local.subnet_names_database : subnet_name => "${module.routetable_database[0].routetable_id}" } : null) : null)
  )
  nsg_ids = merge(
    (var.create_public_subnets ? (length(local.subnet_names_public) > 0 ? { for subnet_name in local.subnet_names_public : subnet_name => "${module.network_security_group[0].network_security_group_id}" } : null) : null),
    # (var.create_private_subnets ? (length(local.subnet_names_private) > 0 ? { for subnet_name in local.subnet_names_private : subnet_name => "${module.network_security_group[0].network_security_group_id}" } : null) : null),
    (var.create_database_subnets ? (length(local.subnet_names_database) > 0 ? { for subnet_name in local.subnet_names_database : subnet_name => "${module.network_security_group[0].network_security_group_id}" } : null) : null)
  )
  tags = local.additional_tags

}

module "routetable_public" {
  count                         = var.create_public_subnets ? 1 : 0
  source                        = "./modules/routetable"
  depends_on                    = [module.resource-group]
  resource_group_name           = var.create_resource_group == false ? var.existing_resource_group_name : module.resource-group[0].resource_group_name
  resource_group_location       = var.resource_group_location
  route_prefixes                = local.route_prefixes_public
  route_nexthop_types           = local.route_nexthop_types_public
  route_names                   = local.route_names_public
  route_table_name              = format("%s-%s-route-table-public", var.environment, var.name)
  disable_bgp_route_propagation = var.disable_bgp_route_propagation_public
  tags                          = local.additional_tags
}

module "routetable_private" {
  count                         = var.create_private_subnets ? 1 : 0
  source                        = "./modules/routetable"
  depends_on                    = [module.resource-group]
  resource_group_name           = var.create_resource_group == false ? var.existing_resource_group_name : module.resource-group[0].resource_group_name
  resource_group_location       = var.resource_group_location
  route_prefixes                = local.route_prefixes_private
  route_nexthop_types           = local.route_nexthop_types_private
  route_names                   = local.route_names_private
  route_table_name              = format("%s-%s-route-table-private", var.environment, var.name)
  disable_bgp_route_propagation = var.disable_bgp_route_propagation_private
  tags                          = local.additional_tags
}

module "routetable_database" {
  count                         = var.create_database_subnets ? 1 : 0
  source                        = "./modules/routetable"
  depends_on                    = [module.resource-group]
  resource_group_name           = var.create_resource_group == false ? var.existing_resource_group_name : module.resource-group[0].resource_group_name
  resource_group_location       = var.resource_group_location
  route_prefixes                = local.route_prefixes_database
  route_nexthop_types           = local.route_nexthop_types_database
  route_names                   = local.route_names_database
  route_table_name              = format("%s-%s-route-table-database", var.environment, var.name)
  disable_bgp_route_propagation = var.disable_bgp_route_propagation_database
  tags                          = local.additional_tags
}

module "network_security_group" {
  count                 = var.create_network_security_group ? 1 : 0
  depends_on            = [module.resource-group]
  source                = "Azure/network-security-group/azurerm"
  version               = "4.1.0"
  resource_group_name   = var.create_resource_group == false ? var.existing_resource_group_name : module.resource-group[0].resource_group_name
  security_group_name   = format("%s-%s-nsg", var.environment, var.name)
  source_address_prefix = [var.address_space]
  tags                  = local.additional_tags
  custom_rules          = local.custom_rules
}

module "nat_gateway" {
  count                       = var.create_nat_gateway ? 1 : 0
  source                      = "./modules/nat-gateway"
  depends_on                  = [module.vnet]
  name                        = format("%s-%s-nat", var.environment, var.name)
  subnet_ids                  = slice(module.vnet[0].vnet_subnets, 0, (length(module.vnet[0].vnet_subnets) - (length(local.public_subnets))))
  location                    = var.resource_group_location
  resource_group_name         = var.create_resource_group == false ? var.existing_resource_group_name : module.resource-group[0].resource_group_name
  create_public_ip            = var.create_public_ip
  public_ip_zones             = var.public_ip_zones
  public_ip_ids               = var.public_ip_ids
  public_ip_domain_name_label = var.public_ip_domain_name_label
  public_ip_reverse_fqdn      = var.public_ip_reverse_fqdn
  nat_gateway_idle_timeout    = var.nat_gateway_idle_timeout
  tags                        = local.additional_tags
}

module "logging" {
  count                     = var.logging_enabled ? 1 : 0
  source                    = "./modules/logging"
  name                      = var.name
  environment               = var.environment
  resource_group_location   = var.resource_group_location
  resource_group_name       = var.create_resource_group == false ? var.existing_resource_group_name : module.resource-group[0].resource_group_name
  network_security_group_id = module.network_security_group[0].network_security_group_id
  tags                      = local.additional_tags
}

module "vpn" {
  count                       = var.create_vpn ? 1 : 0
  depends_on                  = [module.vnet]
  source                      = "./modules/vpn"
  name                        = var.name
  environment                 = var.environment
  resource_group_location     = var.resource_group_location
  resource_group_name         = var.create_resource_group == false ? var.existing_resource_group_name : module.resource-group[0].resource_group_name
  network_security_group_id   = module.network_security_group[0].network_security_group_id
  tags                        = local.additional_tags
  subnet_id                   = [module.vnet[0].vnet_subnets[((length(local.database_subnets)) + (length(local.private_subnets)))]]
  size                        = var.virtual_machine_size
  generate_admin_ssh_key      = var.generate_admin_ssh_key
  os_flavor                   = var.os_flavor
  linux_distribution_name     = var.linux_distribution_name
  nsg_inbound_rules           = var.vpn_nsg_rules
  public_ip_availability_zone = var.public_ip_availability_zone_vpn
}