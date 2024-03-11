output "cluster_id" {
  value = scaleway_k8s_cluster.this.id
}

output "cluster_apiserver_url" {
  value = scaleway_k8s_cluster.this.apiserver_url
}