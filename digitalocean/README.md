# Qdrant Hybrid Cloud Example for DigitalOcean

This Terraform module creates an example infrastructure for Qdrant Hybrid Cloud using DigitalOcean.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | 2.36.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.5.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_kubernetes_cluster.qdrant-hybrid-cloud](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/kubernetes_cluster) | resource |
| [digitalocean_project.qdrant-hybrid-cloud](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/project) | resource |
| [local_file.kubeconfig](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [digitalocean_kubernetes_versions.kubernetes-version](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/kubernetes_versions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_do_token"></a> [do\_token](#input\_do\_token) | Provide a token to access Digital Ocean | `string` | n/a | yes |
| <a name="input_kubernetes_version_prefix"></a> [kubernetes\_version\_prefix](#input\_kubernetes\_version\_prefix) | The Kubernetes version prefix to find latest version | `string` | `"1.29"` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | The number of Droplet instances in the node pool. | `number` | `1` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The prefix for all resources | `string` | `"example"` | no |
| <a name="input_region"></a> [region](#input\_region) | The location of the cluster | `string` | `"fra1"` | no |
| <a name="input_size"></a> [size](#input\_size) | The slug identifier for the type of Droplet to be used as workers in the node pool. | `string` | `"s-4vcpu-8gb"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
  