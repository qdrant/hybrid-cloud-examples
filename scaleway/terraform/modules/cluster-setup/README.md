<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_scaleway"></a> [scaleway](#provider\_scaleway) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [scaleway_k8s_cluster.this](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/k8s_cluster) | resource |
| [scaleway_k8s_pool.current](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/k8s_pool) | resource |
| [scaleway_vpc.this](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/vpc) | resource |
| [scaleway_vpc_private_network.this](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/vpc_private_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | `"qdrant-example"` | no |
| <a name="input_cni"></a> [cni](#input\_cni) | n/a | `string` | `"cilium"` | no |
| <a name="input_delete_additional_resources"></a> [delete\_additional\_resources](#input\_delete\_additional\_resources) | n/a | `bool` | `false` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | n/a | `string` | `"1.29.1"` | no |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | n/a | `string` | `"DEV1-M"` | no |
| <a name="input_pool_size"></a> [pool\_size](#input\_pool\_size) | n/a | `number` | `1` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | n/a | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"fr-par"` | no |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | n/a | `string` | `"192.168.0.0/22"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `list` | `[]` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->