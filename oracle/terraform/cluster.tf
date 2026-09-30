resource "oci_containerengine_cluster" "oke_cluster" {
  name               = var.cluster_name
  compartment_id     = oci_identity_compartment.oke_compartment.id
  vcn_id             = oci_core_vcn.oke_vcn.id
  kubernetes_version = var.kubernetes_version

  options {
    service_lb_subnet_ids = [oci_core_subnet.oke_subnet1.id, oci_core_subnet.oke_subnet2.id]
  }
}

resource "oci_containerengine_node_pool" "node_pool" {
  cluster_id         = oci_containerengine_cluster.oke_cluster.id
  compartment_id     = oci_identity_compartment.oke_compartment.id
  kubernetes_version = var.kubernetes_version
  name               = var.nodepool_name
  node_shape         = var.oci_node_pool_node_shape
  subnet_ids         = [oci_core_subnet.nodePool_Subnet_1.id, oci_core_subnet.nodePool_Subnet_2.id]

  initial_node_labels {
    key   = "key"
    value = "value"
  }

  node_source_details {
    image_id                = var.oci_node_pool_node_image_name
    source_type             = "IMAGE"
    boot_volume_size_in_gbs = "60"
  }

  quantity_per_subnet = var.nodepool_quantity_per_subnet
}
