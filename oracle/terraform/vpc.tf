resource "oci_identity_compartment" "oke_compartment" {
  name            = var.oke_compartment_name
  description     = var.oke_compartment_description
  compartment_id  = local.tenancy_ocid
}

resource "oci_core_vcn" "oke_vcn" {
  cidr_block     = var.oke_vcn_cidr_block
  display_name   = "OKE_VCN"
  compartment_id = oci_identity_compartment.oke_compartment.id
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = local.tenancy_ocid
}

resource "oci_core_subnet" "oke_subnet1" {
  display_name        = "OKE_Subnet1"
  compartment_id      = oci_identity_compartment.oke_compartment.id
  vcn_id              = oci_core_vcn.oke_vcn.id
  cidr_block          = var.oke_subnet1_cidr_block
  route_table_id      = oci_core_vcn.oke_vcn.default_route_table_id
  dhcp_options_id     = oci_core_vcn.oke_vcn.default_dhcp_options_id
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
}

resource "oci_core_subnet" "oke_subnet2" {
  display_name        = "OKE_Subnet2"
  compartment_id      = oci_identity_compartment.oke_compartment.id
  vcn_id              = oci_core_vcn.oke_vcn.id
  cidr_block          = var.oke_subnet2_cidr_block
  route_table_id      = oci_core_vcn.oke_vcn.default_route_table_id
  dhcp_options_id     = oci_core_vcn.oke_vcn.default_dhcp_options_id
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
}

resource "oci_core_subnet" "nodePool_Subnet_1" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  cidr_block          = var.nodepool_subnet1_cidr_block
  compartment_id      = oci_identity_compartment.oke_compartment.id
  vcn_id              = oci_core_vcn.oke_vcn.id
  security_list_ids   = [oci_core_vcn.oke_vcn.default_security_list_id, oci_core_security_list.security_list.id]
  display_name        = "tfSubNet1ForNodePool"
  route_table_id      = oci_core_route_table.route_table.id
}

resource "oci_core_subnet" "nodePool_Subnet_2" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  cidr_block          = var.nodepool_subnet2_cidr_block
  compartment_id      = oci_identity_compartment.oke_compartment.id
  vcn_id              = oci_core_vcn.oke_vcn.id
  security_list_ids   = [oci_core_vcn.oke_vcn.default_security_list_id, oci_core_security_list.security_list.id]
  display_name        = "tfSubNet2ForNodePool"
  route_table_id      = oci_core_route_table.route_table.id
}

resource "oci_core_internet_gateway" "ig" {
  compartment_id = oci_identity_compartment.oke_compartment.id
  display_name   = "tfClusterInternetGateway"
  vcn_id         = oci_core_vcn.oke_vcn.id
}

resource "oci_core_route_table" "route_table" {
  compartment_id = oci_identity_compartment.oke_compartment.id
  vcn_id         = oci_core_vcn.oke_vcn.id
  display_name   = "tfClustersRouteTable"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.ig.id
  }
}

resource "oci_core_security_list" "security_list" {
  compartment_id = oci_identity_compartment.oke_compartment.id
  vcn_id         = oci_core_vcn.oke_vcn.id
  display_name   = var.security_list_display_name

  ingress_security_rules {
    protocol = "All"
    source   = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
  }
}