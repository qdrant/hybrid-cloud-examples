output "nat_gateway_id" {
  description = "Nat Gateway Id"
  value       = azurerm_nat_gateway.natgw.id
}

output "nat_gateway_name" {
  description = "Nat gateway Name"
  value       = azurerm_nat_gateway.natgw.name
}

output "nat_gateway_public_ips" {
  description = "Public IPs associated to Nat Gateway"
  value       = azurerm_public_ip.pip[*].ip_address
}

output "nat_gateway_public_ip_ids" {
  description = "Id of public IPs"
  value       = azurerm_public_ip.pip[*].id
}