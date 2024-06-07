terraform {
  required_providers {
    ovh = {
      source  = "ovh/ovh"
      version = "0.40.0"
    }
  }
  required_version = "~> 1"
}

provider "ovh" {
  endpoint           = var.endpoint
  application_key    = var.application_key
  application_secret = var.application_secret
  consumer_key       = var.consumer_key
}