resource "linode_lke_cluster" "cluster" {
  label       = var.label
  k8s_version = var.k8s_version
  region      = var.cluster_region
  tags        = var.tags

  pool {
    type = var.pool_type

    autoscaler {
      min = var.min_pool_size
      max = var.max_pool_size
    }
    count = var.pool_count
  }
}

resource "local_file" "kubeconfig" {
  content  = base64decode(linode_lke_cluster.cluster.kubeconfig)
  filename = "kubeconfig"
}
