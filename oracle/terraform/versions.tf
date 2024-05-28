terraform {
  required_providers {
    linode = {
      source = "oracle/oci"
      version = "5.43.0"
    }
  }
  required_version = "~> 1"
}