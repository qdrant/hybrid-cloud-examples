module vpc {
  source              = "terraform-ibm-modules/landing-zone-vpc/ibm"
  version             = "7.17.1"
  resource_group_id   = module.resource-group.resource_group_id
  region              = var.region
  prefix              = var.prefix
  name                = var.vpc_name
  subnets             = var.subnets

}