##############################################################################
# Outputs
##############################################################################

output "cluster_id" {
  description = "ID of cluster created"
  value       = var.ignore_worker_pool_size_changes ? ibm_container_vpc_cluster.autoscaling_cluster[0].id : ibm_container_vpc_cluster.cluster[0].id
  depends_on  = [null_resource.confirm_network_healthy]
}

output "cluster_name" {
  description = "Name of the created cluster"
  value       = var.ignore_worker_pool_size_changes ? ibm_container_vpc_cluster.autoscaling_cluster[0].name : ibm_container_vpc_cluster.cluster[0].name
  depends_on  = [null_resource.confirm_network_healthy]
}

output "cluster_crn" {
  description = "CRN for the created cluster"
  value       = var.ignore_worker_pool_size_changes ? ibm_container_vpc_cluster.autoscaling_cluster[0].crn : ibm_container_vpc_cluster.cluster[0].crn
  depends_on  = [null_resource.confirm_network_healthy]
}

output "workerpools" {
  description = "Worker pools created"
  value       = var.ignore_worker_pool_size_changes ? ibm_container_vpc_worker_pool.autoscaling_pool : ibm_container_vpc_worker_pool.pool
}

output "ocp_version" {
  description = "Openshift Version of the cluster"
  value       = var.ignore_worker_pool_size_changes ? ibm_container_vpc_cluster.autoscaling_cluster[0].kube_version : ibm_container_vpc_cluster.cluster[0].kube_version
}

output "cos_crn" {
  description = "CRN of the COS instance"
  value       = var.ignore_worker_pool_size_changes ? ibm_container_vpc_cluster.autoscaling_cluster[0].cos_instance_crn : ibm_container_vpc_cluster.cluster[0].cos_instance_crn
}

output "vpc_id" {
  description = "ID of the clusters VPC"
  value       = var.ignore_worker_pool_size_changes ? ibm_container_vpc_cluster.autoscaling_cluster[0].vpc_id : ibm_container_vpc_cluster.cluster[0].vpc_id
}

output "region" {
  description = "Region cluster is deployed in"
  value       = var.region
}

output "resource_group_id" {
  description = "Resource group ID the cluster is deployed in"
  value       = var.ignore_worker_pool_size_changes ? ibm_container_vpc_cluster.autoscaling_cluster[0].resource_group_id : ibm_container_vpc_cluster.cluster[0].resource_group_id
}

output "ingress_hostname" {
  description = "Ingress hostname"
  value       = var.ignore_worker_pool_size_changes ? ibm_container_vpc_cluster.autoscaling_cluster[0].ingress_hostname : ibm_container_vpc_cluster.cluster[0].ingress_hostname
}

output "private_service_endpoint_url" {
  description = "Private service endpoint URL"
  value       = var.ignore_worker_pool_size_changes ? ibm_container_vpc_cluster.autoscaling_cluster[0].private_service_endpoint_url : ibm_container_vpc_cluster.cluster[0].private_service_endpoint_url
}

output "public_service_endpoint_url" {
  description = "Public service endpoint URL"
  value       = var.ignore_worker_pool_size_changes ? ibm_container_vpc_cluster.autoscaling_cluster[0].public_service_endpoint_url : ibm_container_vpc_cluster.cluster[0].public_service_endpoint_url
}

output "master_url" {
  description = "The URL of the Kubernetes master."
  value       = var.ignore_worker_pool_size_changes ? ibm_container_vpc_cluster.autoscaling_cluster[0].master_url : ibm_container_vpc_cluster.cluster[0].master_url
}

output "kms_config" {
  description = "KMS configuration details"
  value       = var.kms_config
}

output "operating_system" {
  description = "The operating system of the workers in the default worker pool."
  value       = var.ignore_worker_pool_size_changes ? ibm_container_vpc_cluster.autoscaling_cluster[0].operating_system : ibm_container_vpc_cluster.cluster[0].operating_system
}

output "master_status" {
  description = "The status of the Kubernetes master."
  value       = var.ignore_worker_pool_size_changes ? ibm_container_vpc_cluster.autoscaling_cluster[0].master_status : ibm_container_vpc_cluster.cluster[0].master_status
}
