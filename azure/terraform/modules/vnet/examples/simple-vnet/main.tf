locals {
  location    = "eastus"
  environment = "dev"
  name        = "skaf"
  additional_tags = {
    Owner      = "SquareOps"
    Expires    = "Never"
    Department = "Engineering"
  }
  address_space = "10.10.0.0/16"
}

module "vnet" {
  source                  = "squareops/vnet/azurerm"
  name                    = local.name
  address_space           = local.address_space
  environment             = local.environment
  create_resource_group   = true
  resource_group_location = local.location
  create_public_subnets   = true
  num_public_subnets      = 1
  additional_tags         = local.additional_tags
}
