# Main Infra variables

variable "region" {
  type = string
}

# ECR Vars
variable "ecr_name" {
  type = string
}

# ECS Vars
## Task Definition

variable "ecs_td_family" {
  type = string
}

variable "ecs_network_mode" {
  type = string
}

variable "ecs_td_compat" {
  type = string
}

variable "ecs_td_cpu" {
  type = string
}

variable "ecs_td_mem" {
  type = string
}

variable "ecs_log_group" {
  type = string
}

variable "ecs_log_stream" {
  type = string
}

## ECS Cluster

variable "ecs_cluster_name" {
  type = string
}

## ECS Service

variable "ecs_service_name" {
  type = string
}

variable "ecs_vpc" {
  type = string
}

variable "ecs_subnet" {
  type = list(string)
}

variable "ecs_sg" {
  type = list(string)
}

variable "ecs_task_count" {
  type = number
}

### Other variables could be added in for your use case ###
