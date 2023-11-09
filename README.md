# Example App

As a startup company we run very fast while trying to code our infrastructure without repeating ourselves.

## Challenge

Home assignment which comprised into 4 main parts, each part will be evaluated separately, the goal is to complete all 4. Your code need to be clean with proper documentation (`README.md`) and commentary.

1. **Python server application**

    Write a simple Python echo server application.

   * The application should echo back any given string and also return the local ip address, with the geo location of the user.
   * The application should be able to load an `index.html` file from a dedicated local path and serve it from `/index.html` request.
   * The string echo to user will be as a variable that you pass to the script.

2. **Docker**

    Write a `Dockerfile` for your echo server application.

   * The container need to receive 1 environment variable as a string (example: `staging` or `production`).

3. **Helm**

    Create helm deployment for your echo server application

   * You can use most basic helm chart for your application deployment.
   * The deployment should pass Environment variable (`production`, `staging`, etc.) to the container (as mentioned in `#2` and `#1`).
   * .index.html file should be loaded/included as a part of the deployment.
   * Once deployed, the application should be accessible from the public.

4. **Terraform**

    Create a module for a managed Kubernetes cluster with 1 node pool.

   * Model should have also VPC and Public subnets.
   * The cluster can use ELB If you see fit to use one.
   * The Terraform need to trigger the HELM deployment.
   * Extra: Terragrunt deployment of the terraform modules.

## Remarks

You can use the AWS playground account resources for ECR/SSM/EKS with Tags.  
Please add this Tags to all of your created resources:

| Tag Name | Value | Required | Comments |
| :--- | :--- | :---: | :--- |
| Name | Avi Langburd (Your Name) | Yes | |
| Owner | Nati | Yes | |
| Department | DevOps | Yes | |
| Temp | True | Yes | |

* If you have any questions about how to proceed with the test please send us an email.

## The end result

You should trigger the Python application on your browser and get your local Geo location details and the environment variable printed in the page. We want to test your application so please provide us with a dns record to trigger.
