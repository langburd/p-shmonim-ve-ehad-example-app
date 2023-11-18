variable "app_name" {
  description = "The name of the app"
  type        = string
  default     = "app"
}

variable "cluster_name" {
  description = "Name of the EKS cluster to create"
  type        = string
}

variable "certificate_arn" {
  description = "ARN of the ACM certificate"
  type        = string
}
