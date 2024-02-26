module "test-cluster" {
  source = "./modules/cluster-setup"
  project_id = local.project_id
  tags = ["demo", "k8s", "terraform"]
}