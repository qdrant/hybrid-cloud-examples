# Qdrant Hybrid Cloud Example for Gcore

This Terraform module creates an example infrastructure for Qdrant Hybrid Cloud using Gcore.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_gcore"></a> [gcore](#requirement\_gcore) | 0.8.13 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 4.0.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_gcore"></a> [gcore](#provider\_gcore) | 0.8.13 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.5.1 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [gcore_k8sv2.qdrant-hybrid-cloud](https://registry.terraform.io/providers/G-Core/gcore/0.8.13/docs/resources/k8sv2) | resource |
| [gcore_keypair.keypair](https://registry.terraform.io/providers/G-Core/gcore/0.8.13/docs/resources/keypair) | resource |
| [gcore_network.network](https://registry.terraform.io/providers/G-Core/gcore/0.8.13/docs/resources/network) | resource |
| [gcore_subnet.subnet](https://registry.terraform.io/providers/G-Core/gcore/0.8.13/docs/resources/subnet) | resource |
| [local_file.kubeconfig](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [local_file.ssh_public_key_openssh](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [local_sensitive_file.ssh_private_key_pem](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/sensitive_file) | resource |
| [tls_private_key.global_key](https://registry.terraform.io/providers/hashicorp/tls/4.0.4/docs/resources/private_key) | resource |
| [gcore_k8sv2_kubeconfig.qdrant-hybrid-cloud](https://registry.terraform.io/providers/G-Core/gcore/0.8.13/docs/data-sources/k8sv2_kubeconfig) | data source |
| [gcore_project.project](https://registry.terraform.io/providers/G-Core/gcore/0.8.13/docs/data-sources/project) | data source |
| [gcore_region.region](https://registry.terraform.io/providers/G-Core/gcore/0.8.13/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_permanent_api_token"></a> [permanent\_api\_token](#input\_permanent\_api\_token) | API token for Gcore API | `string` | n/a | yes |
| <a name="input_flavor"></a> [flavor](#input\_flavor) | The flavor of the instance | `string` | `"g1-standard-4-8"` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | The number of nodes in the cluster | `number` | `1` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The prefix for all resources | `string` | `"example"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the Gcore project | `string` | `"Default"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region for the setup | `string` | `"Luxembourg-2"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
  
