<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.6 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.27 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.40.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ebs_controller_role"></a> [ebs\_controller\_role](#module\_ebs\_controller\_role) | terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc | 4.24.1 |
| <a name="module_eks"></a> [eks](#module\_eks) | terraform-aws-modules/eks/aws | ~> 20.0 |
| <a name="module_eks-cluster-autoscaler"></a> [eks-cluster-autoscaler](#module\_eks-cluster-autoscaler) | lablabs/eks-cluster-autoscaler/aws | 2.2.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 5.5.3 |

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster_auth.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_eks_access_entry"></a> [eks\_access\_entry](#input\_eks\_access\_entry) | n/a | `any` | n/a | yes |
| <a name="input_auto_scale"></a> [auto\_scale](#input\_auto\_scale) | Enable cluster autoscaling | `bool` | `true` | no |
| <a name="input_aws_profile_name"></a> [aws\_profile\_name](#input\_aws\_profile\_name) | aws config profile name | `string` | `"my-profile"` | no |
| <a name="input_azs"></a> [azs](#input\_azs) | AZs for VPC | `list(string)` | <pre>[<br>  "us-east-1a",<br>  "us-east-1b",<br>  "us-east-1c"<br>]</pre> | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Cluster name | `string` | `"qdrant-cluster-example"` | no |
| <a name="input_kubernetes_version_prefix"></a> [kubernetes\_version\_prefix](#input\_kubernetes\_version\_prefix) | The Kubernetes version prefix to find latest version | `string` | `"1.29"` | no |
| <a name="input_max_nodes"></a> [max\_nodes](#input\_max\_nodes) | Autoscaling maximum node capacity | `string` | `9` | no |
| <a name="input_min_nodes"></a> [min\_nodes](#input\_min\_nodes) | Autoscaling Minimum node capacity | `string` | `1` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | The number of Droplet instances in the node pool. | `number` | `1` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | private subnets CIDR renage for VPC | `list(string)` | <pre>[<br>  "10.0.1.0/24",<br>  "10.0.2.0/24",<br>  "10.0.3.0/24"<br>]</pre> | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | private subnets CIDR renage for VPC | `list(string)` | <pre>[<br>  "10.0.101.0/24",<br>  "10.0.102.0/24",<br>  "10.0.103.0/24"<br>]</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | The location of the cluster | `string` | `"us-east-1"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Default tags | `map(string)` | <pre>{<br>  "Environment": "dev",<br>  "Terraform": "true"<br>}</pre> | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | CIDR renage for VPC | `string` | `"10.0.0.0/16"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Cluster name VPC | `string` | `"qdrant-hybrid-example-vpc"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->