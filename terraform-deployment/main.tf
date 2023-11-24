provider "aws" {

}

module "bitbucket_aws_config" {
    source               = "./modules/bitbucket/"
    region               = var.region
    bitbucket_role_name  = var.bitbucket_role_name
    repository_uuid      = var.repository_uuid
    oidc_url             = var.oidc_url
    client_id            = var.client_id
    thumbprint_list      = var.thumbprint_list
    bitbucket_public_ips = var.bitbucket_public_ips
}

module "aws_discord_bot_infra" {
    source           = "./modules/infra/"
    region           = var.region
    ecr_name         = var.ecr_name
    ecs_td_family    = var.ecs_td_family
    ecs_network_mode = var.ecs_network_mode
    ecs_td_compat    = var.ecs_td_compat
    ecs_td_cpu       = var.ecs_td_cpu
    ecs_td_mem       = var.ecs_td_mem
    ecs_log_group    = var.ecs_log_group
    ecs_log_stream   = var.ecs_log_stream
    ecs_cluster_name = var.ecs_cluster_name
    ecs_service_name = var.ecs_service_name
    ecs_vpc          = var.ecs_vpc
    ecs_subnet       = var.ecs_subnet
    ecs_sg           = var.ecs_sg
    ecs_task_count   = var.ecs_task_count
}
