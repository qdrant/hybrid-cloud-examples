resource "google_container_cluster" "qdrant-hybrid-cloud" {
  name               = "${var.prefix}-qdrant-hybrid-cloud"
  location           = var.gcp_region
  initial_node_count = var.node_count

  deletion_protection = false
  private_cluster_config {
    enable_private_endpoint = false
  }
  timeouts {
    create = "30m"
    update = "40m"
  }
}

data "google_client_config" "default" {}


resource "local_file" "kubeconfig" {
  content = templatefile("${path.module}/kubeconfig.tpl", {
    name                   = "${var.prefix}-qdrant-hybrid-cloud"
    endpoint               = "https://${google_container_cluster.qdrant-hybrid-cloud.endpoint}"
    cluster_ca_certificate = google_container_cluster.qdrant-hybrid-cloud.master_auth[0].cluster_ca_certificate
    access_token           = data.google_client_config.default.access_token
  })
  filename = "kubeconfig"
}
