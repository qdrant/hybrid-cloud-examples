resource "vultr_kubernetes" "qdrant-hybrid-cloud" {
  region  = var.region
  label   = "${var.prefix}-qdrant-hybrid-cloud"
  version = var.k8s_version

  node_pools {
    node_quantity = var.node_count
    plan          = var.node_pools_plan
    label         = "${var.prefix}-qdrant-hybrid-cloud"
  }
}

resource "local_file" "kubeconfig" {
  content  = base64decode(vultr_kubernetes.qdrant-hybrid-cloud.kube_config)
  filename = "kubeconfig"
}
