data "gcore_project" "project" {
  name = var.project_name
}

data "gcore_region" "region" {
  name = var.region
}

resource "tls_private_key" "global_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "local_sensitive_file" "ssh_private_key_pem" {
  filename        = "${path.module}/id_rsa"
  content         = tls_private_key.global_key.private_key_pem
  file_permission = "0600"
}

resource "local_file" "ssh_public_key_openssh" {
  filename = "${path.module}/id_rsa.pub"
  content  = tls_private_key.global_key.public_key_openssh
}

resource "gcore_keypair" "keypair" {
  project_id  = data.gcore_project.project.id
  public_key  = tls_private_key.global_key.public_key_openssh
  sshkey_name = "${var.prefix}-qdrant-hybrid-cloud"
}

resource "gcore_network" "network" {
  name       = "${var.prefix}-qdrant-hybrid-cloud"
  type       = "vlan"
  project_id = data.gcore_project.project.id
  region_id  = data.gcore_region.region.id
}

resource "gcore_subnet" "subnet" {
  name                      = "${var.prefix}-qdrant-hybrid-cloud"
  cidr                      = "192.168.10.0/24"
  network_id                = gcore_network.network.id
  dns_nameservers           = ["8.8.8.8"]
  connect_to_network_router = true
  project_id                = data.gcore_project.project.id
  region_id                 = data.gcore_region.region.id
}

resource "gcore_k8sv2" "qdrant-hybrid-cloud" {
  project_id    = data.gcore_project.project.id
  region_id     = data.gcore_region.region.id
  name          = "${var.prefix}-qdrant"
  fixed_network = gcore_network.network.id
  fixed_subnet  = gcore_subnet.subnet.id
  keypair       = gcore_keypair.keypair.id
  version       = "v1.29.2"

  pool {
    name               = "${var.prefix}-qdrant"
    flavor_id          = var.flavor
    min_node_count     = var.node_count
    max_node_count     = var.node_count
    boot_volume_size   = 40
    boot_volume_type   = "standard"
    servergroup_policy = "anti-affinity"
  }
}

data "gcore_k8sv2_kubeconfig" "qdrant-hybrid-cloud" {
  cluster_name = gcore_k8sv2.qdrant-hybrid-cloud.name
  region_id    = data.gcore_region.region.id
  project_id   = data.gcore_project.project.id
}

resource "local_file" "kubeconfig" {
  content  = data.gcore_k8sv2_kubeconfig.qdrant-hybrid-cloud.kubeconfig
  filename = "kubeconfig"
}