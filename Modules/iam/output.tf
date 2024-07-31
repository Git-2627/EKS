output "actions" {
  value = var.actions
}

output "type" {
  value = var.type
}

output "eks_role_arn" {
  value = aws_iam_role.Shweta-eks_role.arn
}

output "ng_role_arn" {
  value = aws_iam_role.Shweta-write-ng_role.arn
}