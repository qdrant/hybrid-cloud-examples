resource "ovh_cloud_project_kube" "qdrant-hybrid-cloud" {
  service_name = var.service_name
  name         = "${var.prefix}-qdrant-hybrid-cloud"
  region       = var.cluster_region
}

resource "ovh_cloud_project_kube_nodepool" "qdrant-hybrid-cloud-nodes" {
  service_name  = var.service_name
  kube_id       = ovh_cloud_project_kube.qdrant-hybrid-cloud.id
  name          = "${var.prefix}-qdrant-hybrid-cloud"
  flavor_name   = var.node_flavor
  desired_nodes = var.node_count
}

resource "local_file" "kubeconfig" {
  content  = ovh_cloud_project_kube.qdrant-hybrid-cloud.kubeconfig
  filename = "kubeconfig"
}
