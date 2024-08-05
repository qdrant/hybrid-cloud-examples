terraform {
  required_providers {
    gcore = {
      source  = "G-Core/gcore"
      version = "0.8.13"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.4"
    }
  }
}

provider "gcore" {
  permanent_api_token = var.permanent_api_token
}