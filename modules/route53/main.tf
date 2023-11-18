terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.25.0"
    }
  }
}

resource "aws_route53_zone" "this" {
  name = var.hosted_zone_name
  tags = var.tags
}

data "aws_elb_hosted_zone_id" "this" {}

resource "aws_route53_record" "app" {
  zone_id = aws_route53_zone.this.zone_id
  name    = var.app_name
  type    = "A"

  alias {
    name                   = var.elb_dns_name
    zone_id                = data.aws_elb_hosted_zone_id.this.id
    evaluate_target_health = true
  }
}
