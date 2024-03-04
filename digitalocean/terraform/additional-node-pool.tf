resource "digitalocean_kubernetes_node_pool" "node_pools" {
  for_each = var.node_pools

  cluster_id = digitalocean_kubernetes_cluster.qdrant_example.id

  name       = format("%s-%s", var.cluster_name, each.key)
  size       = each.value.size
  node_count = each.value.node_count
  auto_scale = each.value.auto_scale
  min_nodes  = each.value.min_nodes
  max_nodes  = each.value.max_nodes
  tags       = each.value.node_tags
  labels     = each.value.node_labels
}