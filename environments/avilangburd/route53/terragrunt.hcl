terraform {
  source = "${include.root.locals.resource_vars["tf_source"]}"
}

include "root" {
  path   = "${find_in_parent_folders()}"
  expose = true
}

inputs = merge(
  include.root.locals.resource_vars["inputs"],
  {
    app_name     = dependency.helm.outputs.app_name
    elb_dns_name = dependency.helm.outputs.ingress_nginx_elb_hostname
  }
)

dependencies {
  paths = [
    "../helm",
  ]
}

dependency "helm" {
  config_path = "../helm"
  mock_outputs = {
    app_name                   = "p81-exam"
    ingress_nginx_elb_hostname = "p81-exam-123456789.us-east-1.elb.amazonaws.com"
  }
}
