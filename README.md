# Qdrant Hybrid Cloud Examples

Seamlessly deploy and manage your vector database across diverse environments, ensuring performance, security, and cost efficiency for AI-driven applications.

Qdrant Hybrid Cloud integrates Kubernetes clusters from any setting - cloud, on-premises, or edge - into a unified, enterprise-grade managed service.

You can use Qdrant Cloud’s UI to create and manage your database clusters, while they still remain within your infrastructure. All Qdrant databases will operate solely within your network, using your storage and compute resources.

Qdrant Hybrid Cloud ensures data privacy, deployment flexibility, low latency, and delivers cost savings, elevating standards for vector search and AI applications.

## Documentation

- [Qdrant Hybrid Cloud](https://qdrant.tech/documentation/hybrid-cloud/)

## How it works

In order to use Qdrant Hybrid Cloud, you need a standard compliant Kubernetes cluster and attach it as a Hybrid Cloud environment to Qdrant Cloud.

### Creating the infrastructure

The following Terraform modules can be used to set up a basic Kubernetes cluster in different cloud providers. Note, that these modules are used for demonstration purposes only and may require additional configuration to be used in production.

- [AWS EKS](./aws)
- [Google Cloud GKE](./gcp)
- [Azure AKS](./azure)
- [Digital Ocean](./digitalocean)
- [Civo](./civo)
- [Linode](./linode)
- [OVH](./ovh)
- [Scaleway](./scaleway)
- [Vultr](./vultr)

This list is not exhaustive, and you can use any Kubernetes cluster on any infrastructure that meets the [requirements](https://qdrant.tech/documentation/hybrid-cloud/).

### Set up the Hybrid Cloud Environment

After your Kubernetes cluster is ready, you can onboard it as a Hybrid Cloud Environment.

- Connect your lokal shell to the Kubernetes cluster, a `kubeconfig` is generated next to the Terraform module
  - `export KUBECONFIG=./kubeconfig`
- Login to https://cloud.qdrant.io/
- Go to "Hybrid Cloud"
- Create a "Hybrid Cloud Environment", pick a name and a Kubernetes namespace. 
- There are more advanced configuration options available, for a quick evaluation, you can use the default settings.
- Click 'Generate installation Command' button. It will generate `kubectl` and `helm` commands like this: 
``` bash
kubectl create namespace delete-me
kubectl --namespace delete-me create secret docker-registry qdrant-registry-creds
kubectl --namespace delete-me create secret generic qdrant-cloud-creds --from-literal=access-key='*'
helm install qdrant-cloud-agent
```
- Execute this against the created Kubernetes cluster to deploy the Qdrant cloud agent and Qdrant operator
- The agent will connect back to Qdrant cloud, install the operator and report back a healthy status
- Now you can create a Qdrant database cluster within this new environment
  - Note: Make sure that your Qdrant database cluster fits within your Kuber node pools