# Qdrant Hybrid Cloud Example for Linode

This Terraform module creates an example infrastructure for Qdrant Hybrid Cloud using Linode.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1 |
| <a name="requirement_linode"></a> [linode](#requirement\_linode) | 2.16.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_linode"></a> [linode](#provider\_linode) | 2.16.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.5.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [linode_lke_cluster.qdrant-hybrid-cloud](https://registry.terraform.io/providers/linode/linode/2.16.0/docs/resources/lke_cluster) | resource |
| [local_file.kubeconfig](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_token"></a> [token](#input\_token) | This is the Linode API key | `string` | n/a | yes |
| <a name="input_cluster_region"></a> [cluster\_region](#input\_cluster\_region) | This Kubernetes cluster's location | `string` | `"us-central"` | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | The desired Kubernetes version for this Kubernetes cluster in the format of major.minor (e.g. 1.21), and the latest supported patch version will be deployed. | `string` | `"1.28"` | no |
| <a name="input_pool_count"></a> [pool\_count](#input\_pool\_count) | The number of nodes in the Node Pool. | `number` | `3` | no |
| <a name="input_pool_type"></a> [pool\_type](#input\_pool\_type) | A Linode Type for all of the nodes in the Node Pool. | `string` | `"g6-standard-2"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The prefix for all resources | `string` | `"example"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region of the VPC | `string` | `"us-iad"` | no |
| <a name="input_v_subnet"></a> [v\_subnet](#input\_v\_subnet) | The IPv4 range of this subnet in CIDR format. | `string` | `"10.0.0.0/24"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
  
