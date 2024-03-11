resource "scaleway_k8s_cluster" "cluster" {
  name    = var.cluster_name
  version = var.kubernetes_version
  cni     = var.cni
  private_network_id = scaleway_vpc_private_network.this.id
  delete_additional_resources = var.delete_additional_resources
  tags = var.tags
  depends_on = [scaleway_vpc_private_network.this]
}

resource "scaleway_k8s_pool" "node_pool" {
  cluster_id = scaleway_k8s_cluster.cluster.id
  name       = var.cluster_name
  node_type  = var.node_type
  size       = var.pool_size
  tags = var.tags
}

resource "local_file" "kubeconfig" {
  content  = base64decode(scaleway_k8s_cluster.cluster.kubeconfig)
  filename = "kubeconfig"
}