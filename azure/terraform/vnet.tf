resource "azurerm_resource_group" "terraform_infra" {
  name     = format("%s-rg", var.resource_name)
  location = var.region
  tags     = var.tags
}

module "vnet" {
#  source     = "squareops/vnet/azurerm"
  source     = "./modules/vnet"


  name                         = var.vpc_name
  address_space                = var.vpc_cidr
  environment                  = var.environment

  create_resource_group        = false                                       # Enable if you want to a create resource group for AKS cluster.
  existing_resource_group_name = azurerm_resource_group.terraform_infra.name # We will be using resource group create earlier.
  resource_group_location      = var.region
  create_vpn                   = false
  create_nat_gateway           = true
  logging_enabled              = false
  additional_tags              = var.tags
}