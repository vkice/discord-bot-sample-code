# BitBucket

variable "bitbucket_role_name" {
  type = string
  default = "bitbucket-oidc-role"
}

variable "repository_uuid" {
  type = string
  default = "{uuid-goes-here}"
}

variable "oidc_url" {
  type = string
  default = "https://example"
}

variable "client_id" {
  type = list(string)
  default = ["ari:cloud:bitbucket::workspace/example123"]
}

variable "thumbprint_list" {
  type = list(string)
  default = ["a031c46782e6e6c662c2c87c76da9aa62ccabd8e"]
}

variable "bitbucket_public_ips" {
  type = list(string)
  default = [
                "34.199.54.113/32",
                "34.232.25.90/32",
                "34.232.119.183/32",
                "34.236.25.177/32",
                "35.171.175.212/32",
                "52.54.90.98/32",
                "52.202.195.162/32",
                "52.203.14.55/32",
                "52.204.96.37/32",
                "34.218.156.209/32",
                "34.218.168.212/32",
                "52.41.219.63/32",
                "35.155.178.254/32",
                "35.160.177.10/32",
                "34.216.18.129/32"
  ]
}


### AWS variables ###

variable "region" {
  type = string
  default = "us-east-1"
}

# ECR Vars
variable "ecr_name" {
  type = string
  description = "Name for your ECR Repo, this needs to be reflected in your BitBucket pipeline definiton as well"
  default = "my-repo-name"
}

# ECS Vars
## Task Definition

variable "ecs_td_family" {
  type = string
  description = "Name for the task definition"
  default = "my-task-definition"
}

variable "ecs_network_mode" {
  type = string
  default = "awsvpc"
}

variable "ecs_td_compat" {
  type = string
  description = "List of required compatabilities, i.e. Fargate"
  default = "FARGATE"
}

variable "ecs_td_cpu" {
  type = string
  description = "Value for the task cpu, default 256 minimum"
  default = "256"
}

variable "ecs_td_mem" {
  type = string
  description = "Value for the task memory, default 512 minimum"
  default = "512"
}

variable "ecs_log_group" {
  type = string
  description = "Name for the logs group"
  default = "discord-bot-grp"
}

variable "ecs_log_stream" {
  type = string
  description = "Name for the log stream"
  default = "discord-bot-strm"
}

## ECS Cluster

variable "ecs_cluster_name" {
  type = string
  description = "Name for the ECS Cluster"
  default = "kazop-bot-cluster"
}

## ECS Service

variable "ecs_service_name" {
  type = string
  description = "Name for the ECS Service"
  default = "kazop-bot-service"
}

variable "ecs_vpc" {
  type = string
  description = "VPC to operate the container out of"
  default = "vpc-example"
}

variable "ecs_subnet" {
  type = list(string)
  description = "Subnet(s) that your container can run in, ensure it has a route to public internet if needed"
  default = [
    "subnet-example1",
    "subnet-example2",
    "subnet-example3"
  ]
}

variable "ecs_sg" {
  type = list(string)
  description = "Security group to associate with the task, defautls can work (all outbound egress allowed)"
  default = [
    "sg-example"
  ]
}

variable "ecs_task_count" {
  type = number
  description = "How many tasks you'd like running in this service"
  default = 1
}

### Other variables could be added in for your use case ###
