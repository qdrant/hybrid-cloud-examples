terraform {
  required_version = ">= 1.2"

  required_providers {
    curl = {
      source  = "anschoewe/curl"
      version = "1.0.2"
    }
  }
}