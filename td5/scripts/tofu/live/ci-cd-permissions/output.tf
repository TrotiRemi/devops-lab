output "lambda_test_role_arn" {
  description = "The ARN of the IAM role for testing"
  value       = module.iam_roles.lambda_test_role_arn
}

output "lambda_deploy_plan_role_arn" {
  description = "The ARN of the IAM role for deployment plan"
  value       = module.iam_roles.lambda_deploy_plan_role_arn
}

output "lambda_deploy_apply_role_arn" {
  description = "The ARN of the IAM role for deployment apply"
  value       = module.iam_roles.lambda_deploy_apply_role_arn
}
output "oidc_provider_arn" {
  description = "The ARN of the OIDC provider"
  value       = module.oidc_provider.oidc_provider_arn
}