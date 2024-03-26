data "civo_size" "size" {
  filter {
    key    = "name"
    values = [var.node_size]
  }

  sort {
    key       = "ram"
    direction = "asc"
  }
}

resource "civo_kubernetes_cluster" "example-cluster" {
  name         = var.cluster_name
  firewall_id  = civo_firewall.example-cluster-firewall.id
  cluster_type = "k3s"
  pools {
    size       = element(data.civo_size.size.sizes, 0).name
    node_count = var.node_count
  }
}

resource "local_file" "kubeconfig" {
  content  = civo_kubernetes_cluster.example-cluster.kubeconfig
  filename = "kubeconfig"
}
