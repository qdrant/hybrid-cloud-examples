terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.32.0"
    }
  }
  required_version = "~> 1"
}

provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
  zone    = var.gcp_zone
}
