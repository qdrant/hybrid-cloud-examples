# Qdrant Hybrid Cloud Example for Scaleway

This Terraform module creates an example infrastructure for Qdrant Hybrid Cloud using Scaleway.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | 2.5.0 |
| <a name="provider_scaleway"></a> [scaleway](#provider\_scaleway) | 2.38.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [local_file.kubeconfig](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [scaleway_k8s_cluster.cluster](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/k8s_cluster) | resource |
| [scaleway_k8s_pool.node_pool](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/k8s_pool) | resource |
| [scaleway_vpc.qdrant-hybrid-cloud](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/vpc) | resource |
| [scaleway_vpc_private_network.qdrant-hybrid-cloud](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/vpc_private_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key"></a> [access\_key](#input\_access\_key) | Scaleway access key | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project ID | `string` | n/a | yes |
| <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key) | Scaleway secret key | `string` | n/a | yes |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | The version of the Kubernetes cluster. | `string` | `"1.29.1"` | no |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | The commercial type of the pool instances. Instances with insufficient memory are not eligible (DEV1-S, PLAY2-PICO, STARDUST). external is a special node type used to provision from other Cloud providers. | `string` | `"DEV1-M"` | no |
| <a name="input_pool_size"></a> [pool\_size](#input\_pool\_size) | The size of the pool | `number` | `1` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The prefix for all resources | `string` | `"example"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region that will be used as default value for all resources. (fr-par if none specified) | `string` | `"fr-par"` | no |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | The IPv4 subnet to associate with the private network. | `string` | `"192.168.0.0/22"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_apiserver_url"></a> [cluster\_apiserver\_url](#output\_cluster\_apiserver\_url) | n/a |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | n/a |
<!-- END_TF_DOCS -->
