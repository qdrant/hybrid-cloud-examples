variable "prefix" {
  description = "The prefix for all resources"
  default     = "example"
  type        = string
}

variable "permanent_api_token" {
  type        = string
  description = "API token for Gcore API"
}

variable "project_name" {
  type        = string
  description = "The name of the Gcore project"
  default     = "Default"
}

variable "region" {
  type        = string
  description = "The region for the setup"
  default     = "Luxembourg-2"
}

variable "flavor" {
  type        = string
  description = "The flavor of the instance"
  default     = "g1-standard-4-8"
}

variable "node_count" {
  type        = number
  description = "The number of nodes in the cluster"
  default     = 1
}