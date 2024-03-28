output "first_arn" {
  value = aws_iam_user.example[0].arn
  description = "The ARN for the first user"
}

output "user_arns" {
  value = aws_iam_user.example[*].arn
  description = "The ARNs for all users"
}