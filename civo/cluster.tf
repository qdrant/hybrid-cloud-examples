data "civo_size" "node_size" {
  filter {
    key    = "name"
    values = [var.node_size]
  }

  sort {
    key       = "ram"
    direction = "asc"
  }
}

resource "civo_firewall" "qdrant-hybrid-cloud-firewall" {
  name = "${var.prefix}-qdrant-hybrid-cloud"
  ingress_rule {
    label      = "kubernetes-api-server"
    protocol   = "tcp"
    port_range = "6443"
    cidr       = ["0.0.0.0/0"]
    action     = "allow"
  }
}

resource "civo_kubernetes_cluster" "qdrant-hybrid-cloud" {
  name         = "${var.prefix}-qdrant-hybrid-cloud"
  firewall_id  = civo_firewall.qdrant-hybrid-cloud-firewall.id
  cluster_type = "k3s"
  pools {
    size       = element(data.civo_size.node_size.sizes, 0).name
    node_count = var.node_count
  }
}

resource "local_file" "kubeconfig" {
  content  = civo_kubernetes_cluster.qdrant-hybrid-cloud.kubeconfig
  filename = "kubeconfig"
}
