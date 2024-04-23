# Simple VNet

This configuration is suitable for for development environment.

This configuration creates a new Resource Group and Public subnets along with Route Tables and Network Security Group will be created in specified availability zones. 

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which can cost money (Public IPs, for example). Run `terraform destroy` when you don't need these resources.


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vnet"></a> [vnet](#module\_vnet) | [squareops/vnet/azurerm]() | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource_group_location"></a> [resource\_group\_location](#output\_resource\_group\_location) | Resource Group Name Location |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource Group Name |
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | n/a |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | The Name of the newly created vNet |
| <a name="output_vnet_subnets_name_id"></a> [vnet\_subnets\_name\_id](#output\_vnet\_subnets\_name\_id) | Can be queried subnet-id by subnet name by using lookup(module.vnet.vnet\_subnets\_name\_id, subnet1) |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->