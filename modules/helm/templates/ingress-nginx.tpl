## nginx configuration
## Ref: https://github.com/kubernetes/ingress-nginx/blob/main/docs/user-guide/nginx-configuration/index.md
controller:
  containerPort:
    http: 80
    https: 443
  config:
    use-proxy-protocol: "true"
    use-forwarded-headers: "true"
  service:
    enabled: true
    appProtocol: true
    annotations:
      service.beta.kubernetes.io/aws-load-balancer-backend-protocol: tcp
      service.beta.kubernetes.io/aws-load-balancer-proxy-protocol: '*'
      service.beta.kubernetes.io/aws-load-balancer-connection-idle-timeout: "3600"
      service.beta.kubernetes.io/aws-load-balancer-ssl-cert: ${certificate_arn}
      service.beta.kubernetes.io/aws-load-balancer-ssl-ports: https
      service.beta.kubernetes.io/aws-load-balancer-ssl-negotiation-policy: "ELBSecurityPolicy-TLS-1-2-2017-01"
    labels: {}
    externalIPs: []
    loadBalancerIP: ""
    loadBalancerSourceRanges: []
    loadBalancerClass: ""
    enableHttp: true
    enableHttps: true
    ports:
      http: 80
      https: 443
    targetPorts:
      http: http
      https: http
    type: LoadBalancer
