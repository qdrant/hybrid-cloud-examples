<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1 |
| <a name="requirement_vultr"></a> [vultr](#requirement\_vultr) | 2.19.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vultr"></a> [vultr](#provider\_vultr) | 2.19.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vultr_kubernetes.this](https://registry.terraform.io/providers/vultr/vultr/2.19.0/docs/resources/kubernetes) | resource |
| [vultr_kubernetes_node_pools.this](https://registry.terraform.io/providers/vultr/vultr/2.19.0/docs/resources/kubernetes_node_pools) | resource |
| [vultr_vpc.this](https://registry.terraform.io/providers/vultr/vultr/2.19.0/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_key"></a> [api\_key](#input\_api\_key) | This is the Vultr API key | `string` | n/a | yes |
| <a name="input_auto_scaler"></a> [auto\_scaler](#input\_auto\_scaler) | Enable or disable auto-scaling for the VKE cluster | `bool` | `true` | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | The version of your VKE cluster you want deployed | `string` | `"v1.29.1+1"` | no |
| <a name="input_label"></a> [label](#input\_label) | The VKE cluster's label. | `string` | `"qdrant-example"` | no |
| <a name="input_max_node"></a> [max\_node](#input\_max\_node) | The maximum number of nodes in the VKE cluster | `number` | `10` | no |
| <a name="input_min_node"></a> [min\_node](#input\_min\_node) | The minimum number of nodes in the VKE cluster | `number` | `1` | no |
| <a name="input_node_pools_plan"></a> [node\_pools\_plan](#input\_node\_pools\_plan) | The plan for the node pools in your VKE cluster | `string` | `"vc2-4c-8gb"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region your VKE cluster will be deployed in | `string` | `"ewr"` | no |
| <a name="input_v4_subnet_mask"></a> [v4\_subnet\_mask](#input\_v4\_subnet\_mask) | The subnet mask for the virtual subnet | `string` | `"22"` | no |
| <a name="input_v_subnet"></a> [v\_subnet](#input\_v\_subnet) | The virtual subnet for your VKE cluster | `string` | `"192.168.0.0"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->