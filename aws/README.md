# Qdrant Hybrid Cloud Example for AWS

Example how to use AWS EKS cluster as private region for hybrid qdrant cloud. 

### Apply terraform
This terraform code is for a basic VPC and k8s cluster setup in a AWS project.
It is used for Qdrant Cloud hybrid vector database setup example.
- Go to `terraform` folder and run:
  - `terraform init`
  - `terraform apply`


Use: ```aws eks update-kubeconfig --region us-east-1  --name  qdrant-cluster-example``` to update your kubeconfig
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


  