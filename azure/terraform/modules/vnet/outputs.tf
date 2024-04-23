output "resource_group_name" {
  description = "Resource Group Name"
  value       = var.create_resource_group ? module.resource-group[0].resource_group_name : null
}
output "resource_group_location" {
  description = "Resource Group Name Location"
  value       = var.create_resource_group ? module.resource-group[0].resource_group_location : null
}

output "vnet_id" {
  value = module.vnet[0].vnet_id
}

output "vnet_name" {
  description = "The Name of the newly created vNet"
  value       = module.vnet[0].vnet_name
}

output "database_subnets" {
  description = "Database subnet IDs"
  value       = var.create_database_subnets ? length(local.database_subnets) > 0 ? slice(module.vnet[0].vnet_subnets, 0, (length(local.database_subnets))) : [] : null
}

output "database_subnets_cidr" {
  description = "Database subnet CIDRs"
  value       = var.create_database_subnets ? local.database_subnets : []
}

output "private_subnets" {
  description = "Private subnet IDs"
  value       = var.create_private_subnets ? length(local.private_subnets) > 0 ? (var.create_database_subnets ? slice(module.vnet[0].vnet_subnets, length(local.database_subnets), length(local.database_subnets) + length(local.private_subnets)) : slice(module.vnet[0].vnet_subnets, 0, (length(local.private_subnets)))) : [] : null
}

output "private_subnets_cidr" {
  description = "Private subnet CIDRs"
  value       = var.create_private_subnets ? local.private_subnets : []
}

output "public_subnets" {
  description = "Public subnet IDs"
  value       = slice(module.vnet[0].vnet_subnets, max(0, length(local.database_subnets) + length(local.private_subnets)), length(module.vnet[0].vnet_subnets))
}

output "public_subnets_cidr" {
  description = "Public subnet CIDRs"
  value       = var.create_public_subnets ? local.public_subnets : []
}

output "vnet_subnets_name_id" {
  description = "Can be queried subnet-id by subnet name by using lookup(module.vnet.vnet_subnets_name_id, subnet1)"
  value       = module.vnet[0].vnet_subnets_name_id
}

output "network_security_group_id" {
  description = "The id of newly created network security group"
  value       = module.network_security_group[0].network_security_group_id
}

output "route_table_id_database" {
  description = "The id of the newly created Route Table for Databases"
  value       = var.create_database_subnets ? module.routetable_database[0].routetable_id : null
}

output "route_table_id_private" {
  description = "The id of the newly created Route Table"
  value       = var.create_private_subnets ? module.routetable_private[0].routetable_id : null
}

output "route_table_id_public" {
  description = "The id of the newly created Route Table"
  value       = var.create_public_subnets ? module.routetable_public[0].routetable_id : null
}

output "nat_gateway_id" {
  description = "Nat Gateway Id"
  value       = var.create_nat_gateway ? module.nat_gateway[0].nat_gateway_id : null
}

output "nat_gateway_name" {
  description = "Nat gateway Name"
  value       = var.create_nat_gateway ? module.nat_gateway[0].nat_gateway_name : null
}

output "nat_gateway_public_ips" {
  description = "Public IP associated wth the Nat Gateway"
  value       = var.create_nat_gateway ? module.nat_gateway[0].nat_gateway_public_ips : null
}

output "VPN_Public_IP" {
  description = "Public IP for the VPN Server"
  value       = var.create_vpn ? module.vpn[0].vpn_public_ip : null
}
