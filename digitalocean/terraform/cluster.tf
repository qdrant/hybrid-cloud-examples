resource "digitalocean_kubernetes_cluster" "qdrant_example" {
  name    = var.cluster_name
  region  = var.region
  version = data.digitalocean_kubernetes_versions.k8s.latest_version

  vpc_uuid      = digitalocean_vpc.example_vpc.id
  auto_upgrade  = var.auto_upgrade
  surge_upgrade = var.surge_upgrade
  tags          = var.tags

  node_pool {
    name       = format("%s-core", var.cluster_name)
    size       = var.size
    auto_scale = var.auto_scale
    min_nodes  = var.min_nodes
    max_nodes  = var.max_nodes
    node_count = var.node_count
    tags       = var.node_tags
    labels     = var.node_labels
  }
}

data "digitalocean_kubernetes_versions" "k8s" {
  version_prefix = var.kubernetes_version_prefix
}

data "digitalocean_sizes" "k8s" {
  filter {
    key    = "slug"
    values = [var.size]
  }

  filter {
    key    = "regions"
    values = [var.region]
  }

}


resource "local_file" "kubeconfig" {
  content  = digitalocean_kubernetes_cluster.qdrant_example.kube_config.0.raw_config
  filename = "kubeconfig"
}