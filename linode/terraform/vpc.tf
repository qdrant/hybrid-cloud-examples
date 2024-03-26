resource "linode_vpc" "vpc" {
  label  = var.label
  region = var.region
}

resource "linode_vpc_subnet" "subnet" {
  vpc_id = linode_vpc.vpc.id
  label  = var.label
  ipv4   = var.v_subnet
}