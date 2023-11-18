# Example of echo server application written in Python

The requirements of the project are described in [REQUIREMENTS.md](REQUIREMENTS.md)

- The application is running in AWS EKS cluster.  
- The cluster is installed using IaC approach and managed by Terragrunt in `environments` directory.  
- Terraform modules used by Terragrunt are located in `modules` directory.  
- The application itself is located in `app` directory and deployed using the Helm chart located in `helm` directory.  
- Since the CI/CD processes are also out of the scope the building the image and pushing it to the container registry are done manually.  
  As well as all infrastructure chages in Terraform and Terragrunt.

## Build the image and push it to the container registry

```shell
docker build --platform linux/amd64 -t ghcr.io/langburd/p-shmonim-ve-ehad-example-app:v1.0.4 .
docker push ghcr.io/langburd/p-shmonim-ve-ehad-example-app:v1.0.4
```

## Create K8S Secret

- Because secret management is outside the scope of the project, the K8S `Secret` containing the sensitive data is also being created manually.

```shell
kubectl apply -f - <<EOF
apiVersion: v1
kind: Secret
metadata:
  name: p81-exam
type: Opaque
data:
  IPINFO_TOKEN: $(echo -n "very_secret_token" | base64 -w0)
EOF
```

## Deploy application only

```shell
cd environments/avilangburd/helm
terragrunt apply
```

## Deploy all infrastructure and application resources

```shell
cd environments
terragrunt run-all apply
```
