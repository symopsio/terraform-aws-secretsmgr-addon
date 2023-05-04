resource "aws_iam_policy" "this" {
  name = "SymSecretsManager${title(var.environment)}"
  path = "/sym/"

  description = "AWS IAM Policy granting access to Secrets Manager secrets in the /sym/ path tagged with the given environment name."
  policy      = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "secretsmanager:DescribeSecret",
        "secretsmanager:GetSecretValue"
      ],
      "Resource": "*",
      "Condition": { "StringEquals": { "secretsmanager:ResourceTag/${var.tag_name}": "${var.environment}" } }
    }
  ]
}
EOT
}

resource "aws_iam_role_policy_attachment" "attach_secrets_manager_access" {
  # If an IAM Role is specified, then attach the policy to that IAM Role.
  count = var.iam_role_name != "" ? 1 : 0

  policy_arn = aws_iam_policy.this.arn
  role       = var.iam_role_name
}
