module "vpc" {
  source                  = "terraform-google-modules/network/google"
  version                 = "9.0.0"
  project_id              = var.project_id
  network_name            = var.network_name
  subnets                 = var.subnets
  auto_create_subnetworks = var.auto_create_subnetworks
  secondary_ranges        = var.secondary_ranges

  routes = var.default_egress_route
}



module "firewall_rules" {
  source  = "terraform-google-modules/network/google//modules/firewall-rules"
  version = "9.0.0"

  project_id    = var.project_id
  network_name  = module.vpc.network_name
  ingress_rules = var.ingress_rules
  egress_rules  = var.egress_rules
}

resource "google_compute_address" "nat_ips" {
  for_each = toset(local.nat_ip_names)
  name     = each.value
  region   = var.region
  project  = var.project_id
}

module "cloud_router" {
  source  = "terraform-google-modules/cloud-router/google"
  version = "6.0.2"

  name    = "nat-router-${var.env}-${var.region}"
  project = var.project_id
  region  = var.region
  network = module.vpc.network_name

  nats = [{
    name                                = "nat-${var.env}-${var.region}",
    enable_endpoint_independent_mapping = false
    nat_ip_allocate_option              = var.nat_ip_allocate_option
    min_ports_per_vm                    = 3000
    nat_ips                             = [for nat in google_compute_address.nat_ips : nat.self_link]
  }]
}

