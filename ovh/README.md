# Qdrant Hybrid Cloud Example for OVH Cloud

This Terraform module creates an example infrastructure for Qdrant Hybrid Cloud using OVH.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1 |
| <a name="requirement_ovh"></a> [ovh](#requirement\_ovh) | 0.40.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | 2.5.1 |
| <a name="provider_ovh"></a> [ovh](#provider\_ovh) | 0.40.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [local_file.kubeconfig](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [ovh_cloud_project_kube.qdrant-hybrid-cloud](https://registry.terraform.io/providers/ovh/ovh/0.40.0/docs/resources/cloud_project_kube) | resource |
| [ovh_cloud_project_kube_nodepool.qdrant-hybrid-cloud-nodes](https://registry.terraform.io/providers/ovh/ovh/0.40.0/docs/resources/cloud_project_kube_nodepool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_key"></a> [application\_key](#input\_application\_key) | The OVH Cloud API application key | `string` | n/a | yes |
| <a name="input_application_secret"></a> [application\_secret](#input\_application\_secret) | The OVH Cloud API application secret | `string` | n/a | yes |
| <a name="input_consumer_key"></a> [consumer\_key](#input\_consumer\_key) | The OVH Cloud API consumer key | `string` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | The OVH Cloud Project Service name | `string` | n/a | yes |
| <a name="input_cluster_region"></a> [cluster\_region](#input\_cluster\_region) | This Kubernetes cluster's location | `string` | `"DE1"` | no |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | The OVH Cloud API endpoint | `string` | `"ovh-eu"` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | The number of nodes | `number` | `3` | no |
| <a name="input_node_flavor"></a> [node\_flavor](#input\_node\_flavor) | The flavor of the nodes | `string` | `"b2-7"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The prefix for all resources | `string` | `"example"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
