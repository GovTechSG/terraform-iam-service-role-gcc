output "role" {
  description = "The IAM role"
  value       = aws_iam_role.iam_role
}

output "policy" {
  description = "Policy attached to the role."
  value       = aws_iam_role_policy.custom_policy
}
