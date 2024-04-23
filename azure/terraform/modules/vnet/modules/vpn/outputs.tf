output "vpn_public_ip" {
  description = "Public IPs associated to the VPN"
  value       = azurerm_public_ip.pip[*].ip_address
}