resource "digitalocean_vpc" "example_vpc" {
  name     = var.vpc_name
  region   = var.region
  ip_range = var.vpc_cidr
}