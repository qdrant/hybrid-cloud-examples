output "resource_group_name" {
  description = "Resource Group Name"
  value       = module.resource-group.resource_group_name
}
output "resource_group_location" {
  description = "Resource Group Name Location"
  value       = module.resource-group.resource_group_location
}

output "vnet_id" {
  value = module.vnet[0].vnet_id
}

output "vnet_name" {
  description = "The Name of the newly created vNet"
  value       = module.vnet[0].vnet_name
}

output "vnet_subnets_name_id" {
  description = "Can be queried subnet-id by subnet name by using lookup(module.vnet.vnet_subnets_name_id, subnet1)"
  value       = module.vnet[0].vnet_subnets_name_id
}
