output "cluster_id" {
  value = scaleway_k8s_cluster.cluster.id
}

output "cluster_apiserver_url" {
  value = scaleway_k8s_cluster.cluster.apiserver_url
}