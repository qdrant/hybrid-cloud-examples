resource "digitalocean_project" "qdrant-hybrid-cloud" {
  name = "${var.prefix}-qdrant-hybrid-cloud"
  resources = [
    digitalocean_kubernetes_cluster.qdrant-hybrid-cloud.urn
  ]
}

resource "digitalocean_kubernetes_cluster" "qdrant-hybrid-cloud" {
  name    = "${var.prefix}-qdrant-hybrid-cloud"
  region  = var.region
  version = data.digitalocean_kubernetes_versions.kubernetes-version.latest_version

  node_pool {
    name       = "${var.prefix}-qdrant-hybrid-cloud"
    size       = var.size
    node_count = var.node_count
  }
}

data "digitalocean_kubernetes_versions" "kubernetes-version" {
  version_prefix = var.kubernetes_version_prefix
}

resource "local_file" "kubeconfig" {
  content  = digitalocean_kubernetes_cluster.qdrant-hybrid-cloud.kube_config.0.raw_config
  filename = "kubeconfig"
}