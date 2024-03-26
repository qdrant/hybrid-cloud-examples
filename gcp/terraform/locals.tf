locals {
  nat_ip_names = [for i in range(var.nat_ip_count) : format("nat-address-%s-%02d", var.env, i + 1, )]


  master_authorized_networks_config = [
    {
      cidr_blocks = concat(var.master_authorized_networks,
        [
          for ip in var.allowed_ips_to_k8s : {
            display_name = "allowed-ops"
            cidr_block   = "${ip}/32"
          }
        ]
      )
    }
  ]
}