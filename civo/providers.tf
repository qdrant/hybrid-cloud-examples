terraform {
  required_providers {
    civo = {
      source  = "civo/civo"
      version = "1.0.39"
    }
  }
  required_version = "~> 1"
}

provider "civo" {
  token  = var.token
  region = var.region
}