resource "azurerm_resource_group" "terraform_infra" {
  name     = var.resource_group_name
  location = var.resource_group_location

  tags = {
    "Name" = var.resource_group_name
  }
}
