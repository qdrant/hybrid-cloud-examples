locals {
  public_subnets               = var.create_public_subnets ? length(var.address_subnets_public) > 0 ? var.address_subnets_public : [for netnum in range(0, var.num_public_subnets) : cidrsubnet(var.address_space, 8, netnum)] : []
  private_subnets              = var.create_private_subnets ? length(var.address_subnets_private) > 0 ? var.address_subnets_private : [for netnum in range(var.num_private_subnets, var.num_private_subnets * 2) : cidrsubnet(var.address_space, 4, netnum)] : []
  database_subnets             = var.create_database_subnets ? length(var.address_subnets_database) > 0 ? var.address_subnets_database : [for netnum in range(var.num_database_subnets * 2, var.num_database_subnets * 3) : cidrsubnet(var.address_space, 8, netnum)] : []
  route_prefixes_public        = var.create_public_subnets ? length(var.route_prefixes_public) > 0 ? var.route_prefixes_public : [var.address_space, "0.0.0.0/0"] : []
  route_names_public           = var.create_public_subnets ? length(var.route_names_public) > 0 ? var.route_names_public : ["Vnet", "Internet"] : []
  route_nexthop_types_public   = var.create_public_subnets ? length(var.route_nexthop_types_public) > 0 ? var.route_nexthop_types_public : ["VnetLocal", "Internet"] : []
  route_prefixes_private       = var.create_private_subnets ? length(var.route_prefixes_private) > 0 ? var.route_prefixes_private : [var.address_space] : []
  route_names_private          = var.create_private_subnets ? length(var.route_names_private) > 0 ? var.route_names_private : ["Vnet"] : []
  route_nexthop_types_private  = var.create_private_subnets ? length(var.route_nexthop_types_private) > 0 ? var.route_nexthop_types_private : ["VnetLocal"] : []
  route_prefixes_database      = var.create_database_subnets ? length(var.route_prefixes_database) > 0 ? var.route_prefixes_database : [var.address_space] : []
  route_names_database         = var.create_database_subnets ? length(var.route_names_database) > 0 ? var.route_names_database : ["Vnet"] : []
  route_nexthop_types_database = var.create_database_subnets ? length(var.route_nexthop_types_database) > 0 ? var.route_nexthop_types_database : ["VnetLocal"] : []
  subnet_names_public          = var.create_public_subnets ? length(var.subnet_names_public) > 0 ? (var.subnet_names_public) : [for index, public_subnet in local.public_subnets : format("%s-%s-public-subnet-%d", var.environment, var.name, index + 1)] : []
  subnet_names_private         = var.create_private_subnets ? length(var.subnet_names_private) > 0 ? (var.subnet_names_private) : [for index, private_subnet in local.private_subnets : format("%s-%s-private-subnet-%d", var.environment, var.name, index + 1)] : []
  subnet_names_database        = var.create_database_subnets ? length(var.subnet_names_database) > 0 ? (var.subnet_names_database) : [for index, database_subnet in local.database_subnets : format("%s-%s-database-subnet-%d", var.environment, var.name, index + 1)] : []
  additional_tags = merge(
    var.additional_tags, {
      "Name"        = var.name,
      "Environment" = var.environment
    }
  )
  custom_rules = var.create_network_security_group ? length(var.custom_nsg_rules) > 0 ? (var.custom_nsg_rules) : [
    {
      name                         = format("%s-%s-%s", var.name, var.environment, "network-sg-rule-inbound")
      priority                     = 1000
      direction                    = "Inbound"
      access                       = "Allow"
      protocol                     = "*"
      source_port_range            = "*"
      destination_port_range       = "80,443"
      destination_address_prefixes = local.public_subnets
      source_address_prefix        = "*"
    }
  ] : []
}