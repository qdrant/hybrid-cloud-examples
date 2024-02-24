resource "digitalocean_vpc" "example_vpc" {
  name     = "qdrant-example"
  region   = "fra1"
  ip_range = "10.0.0.0/16"
}