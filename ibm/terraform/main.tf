module "resource-group" {
  source  = "terraform-ibm-modules/resource-group/ibm"
  version = "1.1.5"

  resource_group_name = "qdrant-example-rg"
}

module "cluster" {
  source  = "./modules/cluster"

#  source  = "terraform-ibm-modules/base-ocp-vpc/ibm"
#  version = "3.18.3"

  ibmcloud_api_key     = var.ibmcloud_api_key
  cluster_name         = var.cluster_name
  resource_group_id    = module.resource-group.resource_group_id
  region               = var.region
  force_delete_storage = true
  vpc_id               = module.vpc.vpc_id
  vpc_subnets          = module.vpc.subnet_detail_map
  worker_pools         = var.worker_pools
}

