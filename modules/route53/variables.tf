variable "hosted_zone_name" {
  description = "The name of the hosted zone"
  type        = string
}

variable "app_name" {
  description = "The name of the app"
  type        = string
  default     = "app"
}

variable "elb_dns_name" {
  description = "The DNS name of the ELB"
  type        = string
}

variable "tags" {
  description = "The tags to apply to the hosted zone"
  type        = map(string)
  default     = {}
}
