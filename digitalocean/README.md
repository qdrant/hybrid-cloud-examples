# Qdrant Hybrid Cloud Example for DigitalOcean

Example how to use DigitalOcean k8s cluster as private region for hybrid qdrant cloud. 

### Apply terraform
This terraform code is for a basic VPC and k8s cluster setup in a DigitalOcean project.
It is used for Qdrant Cloud hybrid vector database setup example.

### Setup Private region 
After cluster is ready login to https://cloud.qdrant.io/
- Go to "Private regions"
- Create a "Private region", pick a name and a Kubernetes namespace. All other settings should be able to stay as default
- Click 'Generate installation Command' button. It will generate `kubectl` and `helm` commands like this: 
``` bash
kubectl create namespace delete-me
kubectl --namespace delete-me create secret docker-registry qdrant-registry-creds
kubectl --namespace delete-me create secret generic qdrant-cloud-creds --from-literal=access-key='*'
helm install qdrant-cloud-agent
```
- Execute this against the created Kubernetes cluster to deploy the Qdrant cloud agent and Qdrant operator
- The agent should connect back to Qdrant cloud, install the operator and report back a healthy status
- Now you can create a cluster within this new region
  - The cluster should report back as healthy
  - Note: make sure your k8s node pool match with qdrant cluster size you request





## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | \>= 1.0 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | ~> 2.0  |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | ~> 2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_kubernetes_cluster.qdrant_example](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/kubernetes_cluster) | resource |
| [digitalocean_vpc.example_vpc](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/vpc) | resource |
| [digitalocean_kubernetes_versions.k8s](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/kubernetes_versions) | data source |
| [digitalocean_sizes.k8s](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/sizes) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_scale"></a> [auto\_scale](#input\_auto\_scale) | Enable cluster autoscaling | `bool` | `true` | no |
| <a name="input_auto_upgrade"></a> [auto\_upgrade](#input\_auto\_upgrade) | Whether the cluster will be automatically upgraded | `bool` | `true` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Cluster name | `string` | `"qdrant-example"` | no |
| <a name="input_kubernetes_version_prefix"></a> [kubernetes\_version\_prefix](#input\_kubernetes\_version\_prefix) | The Kubernetes version prefix to find latest version | `string` | `"1.29"` | no |
| <a name="input_max_nodes"></a> [max\_nodes](#input\_max\_nodes) | Autoscaling maximum node capacity | `string` | `10` | no |
| <a name="input_min_nodes"></a> [min\_nodes](#input\_min\_nodes) | Autoscaling Minimum node capacity | `string` | `1` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | The number of Droplet instances in the node pool. | `number` | `1` | no |
| <a name="input_node_labels"></a> [node\_labels](#input\_node\_labels) | List of Kubernetes labels to apply to the nodes | `map(any)` | <pre>{<br>  "service": "qdrant-example"<br>}</pre> | no |
| <a name="input_node_tags"></a> [node\_tags](#input\_node\_tags) | The list of instance tags applied to all nodes. | `list(any)` | <pre>[<br>  "qdrant-example"<br>]</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | The location of the cluster | `string` | `"fra1"` | no |
| <a name="input_size"></a> [size](#input\_size) | The slug identifier for the type of Droplet to be used as workers in the node pool. | `string` | `"s-1vcpu-2gb"` | no |
| <a name="input_surge_upgrade"></a> [surge\_upgrade](#input\_surge\_upgrade) | Enable/disable surge upgrades for a cluster | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The list of instance tags applied to the cluster. | `list(any)` | <pre>[<br>  "qdrant"<br>]</pre> | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Cluster name | `string` | `"qdrant-example"` | no |

## Outputs

No outputs.

