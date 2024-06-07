resource "scaleway_vpc_private_network" "qdrant-hybrid-cloud" {
  name   = "${var.prefix}-qdrant-hybrid-cloud"
  vpc_id = scaleway_vpc.qdrant-hybrid-cloud.id
  ipv4_subnet {
    subnet = var.subnet_cidr
  }
}

resource "scaleway_vpc" "qdrant-hybrid-cloud" {
  name = "${var.prefix}-qdrant-hybrid-cloud"
}

resource "scaleway_k8s_cluster" "cluster" {
  name                        = "${var.prefix}-qdrant-hybrid-cloud"
  version                     = var.kubernetes_version
  cni                         = "cilium"
  private_network_id          = scaleway_vpc_private_network.qdrant-hybrid-cloud.id
  delete_additional_resources = true
  depends_on                  = [scaleway_vpc_private_network.qdrant-hybrid-cloud]
}

resource "scaleway_k8s_pool" "node_pool" {
  cluster_id = scaleway_k8s_cluster.cluster.id
  name       = "${var.prefix}-qdrant-hybrid-cloud"
  node_type  = var.node_type
  size       = var.pool_size
}

resource "local_file" "kubeconfig" {
  content  = scaleway_k8s_cluster.cluster.kubeconfig[0].config_file
  filename = "kubeconfig"
}