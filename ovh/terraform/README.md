<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1 |
| <a name="requirement_linode"></a> [linode](#requirement\_linode) | 0.40.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_ovh"></a> [ovh](#provider\_ovh) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [local_file.kubeconfig](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [ovh_cloud_project_kube.qdrant-example](https://registry.terraform.io/providers/hashicorp/ovh/latest/docs/resources/cloud_project_kube) | resource |
| [ovh_cloud_project_kube_nodepool.qdrant-example-nodes](https://registry.terraform.io/providers/hashicorp/ovh/latest/docs/resources/cloud_project_kube_nodepool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_key"></a> [application\_key](#input\_application\_key) | The OVH Cloud API application key | `string` | n/a | yes |
| <a name="input_application_secret"></a> [application\_secret](#input\_application\_secret) | The OVH Cloud API application secret | `string` | n/a | yes |
| <a name="input_consumer_key"></a> [consumer\_key](#input\_consumer\_key) | The OVH Cloud API consumer key | `string` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | The OVH Cloud Project Service name | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | This Kubernetes cluster's name | `string` | `"qdrant-example"` | no |
| <a name="input_cluster_region"></a> [cluster\_region](#input\_cluster\_region) | This Kubernetes cluster's location | `string` | `"GRA5"` | no |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | The OVH Cloud API endpoint | `string` | `"ovh-eu"` | no |
| <a name="input_max_nodes"></a> [max\_nodes](#input\_max\_nodes) | The maximum number of nodes | `number` | `3` | no |
| <a name="input_min_nodes"></a> [min\_nodes](#input\_min\_nodes) | The minimum number of nodes | `number` | `1` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | The number of nodes | `number` | `3` | no |
| <a name="input_node_flavor"></a> [node\_flavor](#input\_node\_flavor) | The flavor of the nodes | `string` | `"b2-7"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->