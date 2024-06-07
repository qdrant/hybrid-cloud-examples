# Qdrant Hybrid Cloud Example for Google Cloud

This Terraform module creates an example infrastructure for Qdrant Hybrid Cloud using Google Cloud.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 5.32.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.32.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.5.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_container_cluster.qdrant-hybrid-cloud](https://registry.terraform.io/providers/hashicorp/google/5.32.0/docs/resources/container_cluster) | resource |
| [local_file.kubeconfig](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [google_client_config.default](https://registry.terraform.io/providers/hashicorp/google/5.32.0/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_project"></a> [gcp\_project](#input\_gcp\_project) | The GCP target project ID | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | The GCP target region | `string` | `"us-central1"` | no |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | The GCP target zone | `string` | `"us-central1-c"` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | Node count | `string` | `3` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The prefix for all resources | `string` | `"example"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
  