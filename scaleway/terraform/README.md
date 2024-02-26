<!-- BEGIN_TF_DOCS -->
## Prerequisites

Before you begin, ensure you have the following prerequisites:

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- Scaleway account with access and secret keys.

## How to use

1. Clone this repository to your local machine:

   ```bash
   git clone <repository-url>

2. Navigate to the cloned directory:
    ```bash
   Navigate to the cloned directory:

3. Create a terraform.tfvars file and fill in your Scaleway access and secret keys and project id as well:
    ```bash
    access_key = "your-access-key"
    secret_key = "your-secret-key"
    project_id = "your-project-id"

4. Optionally, modify the variables.tf file to adjust cluster configurations such as name, version, CNI, node type, pool size, tags, etc.

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

## Providers

| Name | Version |
|------|---------|
| <a name="provider_scaleway"></a> [scaleway](#provider\_scaleway) | 2.37.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [scaleway_k8s_cluster.this](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/k8s_cluster) | resource |
| [scaleway_k8s_pool.current](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/k8s_pool) | resource |
| [scaleway_vpc.this](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/vpc) | resource |
| [scaleway_vpc_private_network.this](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/vpc_private_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key"></a> [access\_key](#input\_access\_key) | Scaleway access key | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name for the Kubernetes cluster. | `string` | `"qdrant-example"` | no |
| <a name="input_cni"></a> [cni](#input\_cni) | The Container Network Interface (CNI) for the Kubernetes cluster. | `string` | `"cilium"` | no |
| <a name="input_delete_additional_resources"></a> [delete\_additional\_resources](#input\_delete\_additional\_resources) | Delete additional resources like block volumes, load-balancers and the cluster's private network (if empty) that were created in Kubernetes on cluster deletion. ~> Important: Setting this field to true means that you will lose all your cluster data and network configuration when you delete your cluster. If you prefer keeping it, you should instead set it as false. | `bool` | `false` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | The version of the Kubernetes cluster. | `string` | `"1.29.1"` | no |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | The commercial type of the pool instances. Instances with insufficient memory are not eligible (DEV1-S, PLAY2-PICO, STARDUST). external is a special node type used to provision from other Cloud providers. | `string` | `"DEV1-M"` | no |
| <a name="input_pool_size"></a> [pool\_size](#input\_pool\_size) | The size of the pool | `number` | `1` | no |
| <a name="input_region"></a> [region](#input\_region) | The region that will be used as default value for all resources. (fr-par if none specified) | `string` | `"fr-par"` | no |
| <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key) | Scaleway secret key | `string` | n/a | yes |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | The IPv4 subnet to associate with the private network. | `string` | `"192.168.0.0/22"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource tags | `list(string)` | <pre>[<br>  "demo",<br>  "k8s",<br>  "terraform"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_apiserver_url"></a> [cluster\_apiserver\_url](#output\_cluster\_apiserver\_url) | n/a |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | n/a |
<!-- END_TF_DOCS -->