resource "vultr_kubernetes" "this" {
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

resource "vultr_kubernetes_node_pools" "this" {
  cluster_id = vultr_kubernetes.this.id
  node_quantity = 1
  plan = var.node_pools_plan
  label = var.label
  auto_scaler = var.auto_scaler
  min_nodes = 1
  max_nodes = 10
}