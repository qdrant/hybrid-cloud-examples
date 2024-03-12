<!-- BEGIN_TF_DOCS -->
## Prerequisites

Before you begin, ensure you have the following prerequisites:

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- Linode account with API token.

## How to use

1. Clone this repository to your local machine:

   ```bash
   git clone <repository-url>

2. Navigate to the cloned directory:
    ```bash
   Navigate to the cloned directory:

3. Create a terraform.tfvars file and fill in your Linode API token:
    ```bash
    token = "your-API-token"

4. Optionally, modify the variables.tf file to adjust cluster configurations such as name, version, node type, pool size, tags, etc.

5. Initialize Terraform:
    ```bash
   terraform init
6. Review the execution plan:
    ```bash
   terraform apply

7. After provisioning, you can access your Kubernetes cluster using the provided credentials.

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
| [linode_lke_cluster.cluster](https://registry.terraform.io/providers/linode/linode/2.16.0/docs/resources/lke_cluster) | resource |
| [linode_vpc.vpc](https://registry.terraform.io/providers/linode/linode/2.16.0/docs/resources/vpc) | resource |
| [linode_vpc_subnet.subnet](https://registry.terraform.io/providers/linode/linode/2.16.0/docs/resources/vpc_subnet) | resource |
| [local_file.kubeconfig](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_region"></a> [cluster\_region](#input\_cluster\_region) | This Kubernetes cluster's location | `string` | `"us-central"` | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | The desired Kubernetes version for this Kubernetes cluster in the format of major.minor (e.g. 1.21), and the latest supported patch version will be deployed. | `string` | `"1.28"` | no |
| <a name="input_label"></a> [label](#input\_label) | The label of the VPC. This field can only contain ASCII letters, digits and dashes. | `string` | `"qdrant-example"` | no |
| <a name="input_max_pool_size"></a> [max\_pool\_size](#input\_max\_pool\_size) | The maximum number of nodes to autoscale to. | `number` | `10` | no |
| <a name="input_min_pool_size"></a> [min\_pool\_size](#input\_min\_pool\_size) | The minimum number of nodes to autoscale to. | `number` | `3` | no |
| <a name="input_pool_count"></a> [pool\_count](#input\_pool\_count) | The number of nodes in the Node Pool. If undefined with an autoscaler the initial node count will equal the autoscaler minimum. | `number` | `3` | no |
| <a name="input_pool_type"></a> [pool\_type](#input\_pool\_type) | A Linode Type for all of the nodes in the Node Pool. | `string` | `"g6-standard-2"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region of the VPC | `string` | `"us-iad"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | An array of tags applied to the Kubernetes cluster. Tags are case-insensitive and are for organizational purposes only. | `list(string)` | <pre>[<br>  "qdrant"<br>]</pre> | no |
| <a name="input_token"></a> [token](#input\_token) | This is the Linode API key | `string` | n/a | yes |
| <a name="input_v_subnet"></a> [v\_subnet](#input\_v\_subnet) | The IPv4 range of this subnet in CIDR format. | `string` | `"10.0.0.0/24"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->