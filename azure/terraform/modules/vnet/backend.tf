# terraform {
#   backend "azurerm" {
#     resource_group_name  = ""
#     storage_account_name = "skafstorageaccount"
#     container_name       = "terraformbackendtfstate"
#     key                  = "terraform-infra/vnet.tfstate"
#   }
# }