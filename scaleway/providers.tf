terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
    }
  }
  required_version = "~> 1"
}

provider "scaleway" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
  project_id = var.project_id
}