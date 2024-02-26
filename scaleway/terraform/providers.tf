provider "scaleway" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = var.region
  project_id = local.project_id
}