resource "ovh_cloud_project_kube" "qdrant-example" {
  service_name = var.service_name
  name         = var.cluster_name
  region       = var.cluster_region
}

resource "ovh_cloud_project_kube_nodepool" "qdrant-example-nodes" {
  service_name  = var.service_name
  kube_id       = ovh_cloud_project_kube.qdrant-example.id
  name          = var.cluster_name
  flavor_name   = var.node_flavor
  desired_nodes = var.node_count
  max_nodes     = var.max_nodes
  min_nodes     = var.min_nodes
}

resource "local_file" "kubeconfig" {
  content  = ovh_cloud_project_kube.qdrant-example.kubeconfig
  filename = "kubeconfig"
}
