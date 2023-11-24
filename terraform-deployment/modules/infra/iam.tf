# First check if you can import the role, meaning it already exists and we will move it to be managed by Terraform: terraform import aws_iam_role.ecs_task_execution_role ecsTaskExecutionRole
resource "aws_iam_role" "ecs_task_execution_role" {
  name          = "ecsTaskExecutionRole"
  description   = "Allows ECS tasks to call AWS services on your behalf."

    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Sid": "",
          "Effect": "Allow",
          "Principal": {
              "Service": "ecs-tasks.amazonaws.com"
          },
          "Action": "sts:AssumeRole"
      }
  ]
}
EOF
}

data "aws_iam_policy" "managed_ecs_task_exec" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
data "aws_iam_policy" "managed_cloudwatch_admin_access" {
  arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
}

resource "aws_iam_role_policy_attachment" "ecs_task_policy_attach" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = data.aws_iam_policy.managed_ecs_task_exec.arn
}

resource "aws_iam_role_policy_attachment" "cw_admin_policy_attach" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = data.aws_iam_policy.managed_cloudwatch_admin_access.arn
}
