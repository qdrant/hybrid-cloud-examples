# Qdrant Hybrid Cloud Example for Azure

This Terraform module creates an example infrastructure for Qdrant Hybrid Cloud using Azure.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.107.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.107.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.5.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.qdrant-hybrid-cloud](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/kubernetes_cluster) | resource |
| [azurerm_resource_group.qdrant-hybrid-cloud](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/resource_group) | resource |
| [azurerm_subnet.qdrant-hybrid-cloud-internal](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/subnet) | resource |
| [azurerm_virtual_network.qdrant-hybrid-cloud](https://registry.terraform.io/providers/hashicorp/azurerm/3.107.0/docs/resources/virtual_network) | resource |
| [local_file.kubeconfig](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_client_id"></a> [azure\_client\_id](#input\_azure\_client\_id) | The Azure client ID | `string` | n/a | yes |
| <a name="input_azure_client_secret"></a> [azure\_client\_secret](#input\_azure\_client\_secret) | The Azure client secret | `string` | n/a | yes |
| <a name="input_azure_subscription_id"></a> [azure\_subscription\_id](#input\_azure\_subscription\_id) | The Azure subscription ID | `string` | n/a | yes |
| <a name="input_azure_tenant_id"></a> [azure\_tenant\_id](#input\_azure\_tenant\_id) | The Azure tenant ID | `string` | n/a | yes |
| <a name="input_azure_location"></a> [azure\_location](#input\_azure\_location) | Azure location used for all resources | `string` | `"East US"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type used for all nodes | `string` | `"Standard_DS2_v2"` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | Node count | `string` | `3` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The prefix for all resources | `string` | `"example"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
  