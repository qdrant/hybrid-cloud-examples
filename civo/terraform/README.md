<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1 |
| <a name="requirement_civo"></a> [civo](#requirement\_civo) | 1.0.39 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_civo"></a> [civo](#provider\_civo) | 1.0.39 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.5.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [civo_firewall.example-cluster-firewall](https://registry.terraform.io/providers/civo/civo/1.0.39/docs/resources/firewall) | resource |
| [civo_kubernetes_cluster.example-cluster](https://registry.terraform.io/providers/civo/civo/1.0.39/docs/resources/kubernetes_cluster) | resource |
| [local_file.kubeconfig](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [civo_size.size](https://registry.terraform.io/providers/civo/civo/1.0.39/docs/data-sources/size) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_token"></a> [token](#input\_token) | This is the Linode API key | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the cluster | `string` | `"civo-k8s"` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | Node count | `string` | `3` | no |
| <a name="input_node_size"></a> [node\_size](#input\_node\_size) | The size of the nodes | `string` | `"g4s.kube.medium"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region of the cluster | `string` | `"LON1"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->