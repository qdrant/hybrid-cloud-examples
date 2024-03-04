# Create GKE cluster

resource "google_container_cluster" "gke" {
  name                     = var.cluster_name
  project                  = var.project_id
  location                 = var.region
  remove_default_node_pool = true
  initial_node_count       = var.initial_node_count
  min_master_version       = var.min_master_version
  network                  = module.vpc.network_name
  subnetwork               = module.vpc.subnets_names[0]


  private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes    = true
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  }

  dynamic "master_authorized_networks_config" {
    for_each = local.master_authorized_networks_config
    content {
      dynamic "cidr_blocks" {
        for_each = master_authorized_networks_config.value.cidr_blocks
        content {
          cidr_block   = cidr_blocks.value.cidr_block
          display_name = cidr_blocks.value.display_name
        }
      }
    }
  }

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  enable_intranode_visibility = true

}

# Create additional-node-pool
resource "google_container_node_pool" "additional" {
  for_each = var.additional_node_pool
  name     = each.key
  location = var.region
  project  = var.project_id
  cluster  = google_container_cluster.gke.name

  node_count = each.value.min_node_count
  version    = var.node_version

  autoscaling {
    min_node_count = each.value.min_node_count
    max_node_count = each.value.max_node_count
  }

  node_config {
    preemptible  = each.value.preemptible
    spot         = each.value.spot
    machine_type = each.value.machine_type
    image_type   = each.value.image_type

    labels = each.value.labels
    dynamic "taint"  {
      for_each = each.value.taint
      content {
               key    = each.value.taint.key
               value  = each.value.taint.value
               effect = each.value.taint.effect
      }
    }


    workload_metadata_config {
      mode = "GKE_METADATA"
    }
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  lifecycle {
    ignore_changes = [
      node_count,
      version
    ]
  }
}

