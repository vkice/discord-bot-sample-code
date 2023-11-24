resource "aws_iam_openid_connect_provider" "bitbucket" {
  url             = var.oidc_url
  client_id_list  = var.client_id
  thumbprint_list = var.thumbprint_list
}

resource "aws_iam_role" "bitbucket_oidc_role" {
  name = var.bitbucket_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Federated = aws_iam_openid_connect_provider.bitbucket.arn
        },
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
            StringLike = {
                "${aws_iam_openid_connect_provider.bitbucket.url}:sub": "${var.repository_uuid}:*"
            }
            IpAddress = {
                "aws:SourceIp": var.bitbucket_public_ips
            }
        }  
      }
    ]
  })
}

data "aws_iam_policy" "managed_ecr_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"
}

data "aws_iam_policy" "managed_ecs_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonECS_FullAccess"
}

resource "aws_iam_role_policy_attachment" "policy_ecr_attach" {
  role       = aws_iam_role.bitbucket_oidc_role.name
  policy_arn = data.aws_iam_policy.managed_ecr_policy.arn
}

resource "aws_iam_role_policy_attachment" "policy_ecs_attach" {
  role       = aws_iam_role.bitbucket_oidc_role.name
  policy_arn = data.aws_iam_policy.managed_ecs_policy.arn
}
