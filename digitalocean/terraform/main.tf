module "test-cluster" {
  source = "./modules/cluster-setup"

  cluster_name = "qdrant-example"
  vpc_name     = "qdrant-example"

  size = "s-4vcpu-8gb"

}