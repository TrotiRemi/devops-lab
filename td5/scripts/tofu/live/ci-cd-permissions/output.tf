output "iam_role_for_testing_arn" {
  description = "IAM Role ARN for testing"
  value       = module.iam_roles.iam_role_for_testing_arn
}

output "iam_role_for_plan_arn" {
  description = "IAM Role ARN for Terraform plan"
  value       = module.iam_roles.iam_role_for_plan_arn
}

output "iam_role_for_apply_arn" {
  description = "IAM Role ARN for Terraform apply"
  value       = module.iam_roles.iam_role_for_apply_arn
}
