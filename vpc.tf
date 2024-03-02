resource "vultr_vpc" "this" {
  description = "Qdrant VPC"
  region = var.region
  v4_subnet  = var.v_subnet
  v4_subnet_mask = var.v4_subnet_mask
}