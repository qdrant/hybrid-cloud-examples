resource "scaleway_k8s_cluster" "this" {
  name    = var.cluster_name
  version = var.kubernetes_version
  cni     = var.cni
  private_network_id = scaleway_vpc_private_network.this.id
  delete_additional_resources = var.delete_additional_resources
  project_id = var.project_id
  tags = var.tags
  depends_on = [scaleway_vpc_private_network.this]
}

resource "scaleway_k8s_pool" "current" {
  cluster_id = scaleway_k8s_cluster.this.id
  name       = var.cluster_name
  node_type  = var.node_type
  size       = var.pool_size
  tags = var.tags
}