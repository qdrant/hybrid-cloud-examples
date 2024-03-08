resource "vultr_kubernetes" "cluster" {
  region  = var.region
  label   = var.label
  version = var.k8s_version

  node_pools {
    node_quantity = 1
    plan          = var.node_pools_plan
    label         = var.label
    auto_scaler   = var.auto_scaler
    min_nodes     = var.min_node
    max_nodes     = var.max_node
  }
}

resource "local_file" "kubeconfig" {
  content  = base64decode(vultr_kubernetes.cluster.kube_config)
  filename = "kubeconfig"
}
