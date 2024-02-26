resource "scaleway_vpc_private_network" "this" {
  name = var.cluster_name
  tags = var.tags
  vpc_id = scaleway_vpc.this.id
  ipv4_subnet {
    subnet = var.subnet_cidr
  }
}

resource "scaleway_vpc" "this" {
  name = var.cluster_name
  tags = var.tags
}