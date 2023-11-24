output "bitbucket_iam_role_arn" {
  value     = module.bitbucket_aws_config.bitbucket_iam_role_arn
}

output "ecr_repo_url" {
  value     = module.aws_discord_bot_infra.ecr_repo_url
}