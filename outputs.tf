output "policy_arn" {
  description = "The ARN of the generated AWS IAM Policy that grants access to Secrets Manager secrets in the /sym/ path."
  value       = aws_iam_policy.this.arn
}
