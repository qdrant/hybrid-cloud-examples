resource "linode_lke_cluster" "qdrant-hybrid-cloud" {
  label       = "${var.prefix}-qdrant-hybrid-cloud"
  k8s_version = var.k8s_version
  region      = var.cluster_region

  pool {
    type  = var.pool_type
    count = var.pool_count
  }
}

resource "local_file" "kubeconfig" {
  content  = base64decode(linode_lke_cluster.qdrant-hybrid-cloud.kubeconfig)
  filename = "kubeconfig"
}
