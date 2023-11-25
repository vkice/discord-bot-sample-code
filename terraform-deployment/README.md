# Discord Bot Terraform Deployment

Welcome to the advanced section of my guide for deploying a Discord bot hosted on AWS. For a comprehensive walkthrough, please visit [my guide](https://vkice.me/posts/discord-python-bot-docker-ecs-aws/).

These Terraform configurations are designed to streamline the deployment of your Discord bot on AWS infrastructure. 
- **Experienced Users:** Integrate these templates seamlessly into your existing set-up.
- **Beginners:** Ready-to-deploy configurations, just supply your deployment credentials.

## Repository Contents

Within this repository, you'll find the following files:

- `main.tf`: Establishes the AWS infrastructure and roles necessary for BitBucket OIDC.
- `outputs.tf`: Provides the ECR Repo URL and the ARN for the BitBucket role, for use in your `bitbucket-pipelines.yml`.
- `terraform.tf`: Initializes Terraform with the specified versions of the Terraform and AWS providers.
- `variables.tf`: Centralized location for all customizable variables, including names and parameters.
- `bitbucket/`: Contains the modularized BitBucket OIDC Role.
- `infra/`: Contains all other AWS components such as ECR, ECS, and IAM resources, broken down into modules.

## Important Notes

Prior knowledge of Terraform setup and state file management is assumed. If you're new to Terraform or the AWS Provider, it's highly recommended to complete the [Hashicorp's AWS tutorial](https://developer.hashicorp.com/terraform/tutorials/aws-get-started) before proceeding.

Happy Deployment!