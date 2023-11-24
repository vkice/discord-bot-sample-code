resource "aws_ecs_task_definition" "discord_bot_task_definition" {
    family                   = var.ecs_td_family
    network_mode             = var.ecs_network_mode
    requires_compatibilities = [ var.ecs_td_compat ]
    execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
    task_role_arn            = aws_iam_role.ecs_task_execution_role.arn
    cpu                      = var.ecs_td_cpu
    memory                   = var.ecs_td_mem

    container_definitions = <<TASK_DEFINITION
[
{
    "name": "${var.ecs_td_family}",
    "image": "${aws_ecr_repository.discord_bot_image_repo.repository_url}:latest",
    "cpu": ${var.ecs_td_cpu},
    "memory": ${var.ecs_td_mem},
    "essential": true,
    "logConfiguration": {
    "logDriver": "awslogs",
    "options": {
        "awslogs-create-group": "true",
        "awslogs-group": "${var.ecs_log_group}",
        "awslogs-region": "${var.region}",
        "awslogs-stream-prefix": "${var.ecs_log_stream}"
    }
    }
}
]
TASK_DEFINITION


    runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
    }
}

resource "aws_ecs_cluster" "discord_bot_cluster" {
  name = var.ecs_cluster_name
}

resource "aws_ecs_cluster_capacity_providers" "ecs_provider" {
  cluster_name = aws_ecs_cluster.discord_bot_cluster.name
  capacity_providers = [ var.ecs_td_compat ]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = var.ecs_td_compat
  }
}

resource "aws_ecs_service" "discord_bot_service" {
    name            = var.ecs_service_name
    cluster         = aws_ecs_cluster.discord_bot_cluster.id
    task_definition = aws_ecs_task_definition.discord_bot_task_definition.arn

    network_configuration {
        subnets = var.ecs_subnet
        security_groups = var.ecs_sg
    }

    capacity_provider_strategy {
        capacity_provider = var.ecs_td_compat
        base              = 1
        weight            = 100
    }

    desired_count = var.ecs_task_count
}
