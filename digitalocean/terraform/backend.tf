terraform {
  backend "s3" {
    bucket  = "terraform-tfstate-staging-v2"
    key     = "backend/hybrid-cloud-examples/digitalocean/terraform.tfstate"
    region  = "eu-central-1"
    profile = "qdrant-stg-v2"
  }

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}
