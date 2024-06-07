variable "gcp_project" {
  description = "The GCP target project ID"
  type        = string
}
variable "gcp_region" {
  description = "The GCP target region"
  default     = "us-central1"
  type        = string
}
variable "gcp_zone" {
  description = "The GCP target zone"
  default     = "us-central1-c"
  type        = string
}
variable "prefix" {
  description = "The prefix for all resources"
  default     = "example"
  type        = string
}
variable "node_count" {
  description = "Node count"
  type        = string
  default     = 3
}