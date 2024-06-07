# Qdrant Hybrid Cloud Example for Vultr

This Terraform module creates an example infrastructure for Qdrant Hybrid Cloud using Vultr.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1 |
| <a name="requirement_vultr"></a> [vultr](#requirement\_vultr) | 2.19.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | 2.4.1 |
| <a name="provider_vultr"></a> [vultr](#provider\_vultr) | 2.19.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [local_file.kubeconfig](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [vultr_kubernetes.qdrant-hybrid-cloud](https://registry.terraform.io/providers/vultr/vultr/2.19.0/docs/resources/kubernetes) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_key"></a> [api\_key](#input\_api\_key) | This is the Vultr API key | `string` | n/a | yes |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | The version of your VKE cluster you want deployed | `string` | `"v1.30.0+1"` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | The number of nodes in the VKE cluster | `number` | `3` | no |
| <a name="input_node_pools_plan"></a> [node\_pools\_plan](#input\_node\_pools\_plan) | The plan for the node pools in your VKE cluster | `string` | `"vc2-4c-8gb"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The prefix for all resources | `string` | `"example"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region your VKE cluster will be deployed in | `string` | `"ewr"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
  
