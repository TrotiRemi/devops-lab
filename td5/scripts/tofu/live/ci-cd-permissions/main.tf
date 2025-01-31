provider "aws" {
  region = "us-east-2" # Remplace par ta région AWS
}

module "oidc_provider" {
  source = "git::https://github.com/TrotiRemi/devops-lab.git//td5/scripts/tofu/modules/github-aws-oidc?ref=opentofu-tests"
}

module "iam_roles" {
  source = "../../modules/gh-actions-iam-roles" # Chemin local au lieu de GitHub
  name = "lambda-sample"
  oidc_provider_arn = module.oidc_provider.oidc_provider_arn
  enable_iam_role_for_testing = true
  enable_iam_role_for_plan = true
  enable_iam_role_for_apply = true

  # ⚠️ Remplace "YOUR_GITHUB_USERNAME/YOUR_GITHUB_REPO" par ton repo GitHub
  github_repo = "YOUR_GITHUB_USERNAME/YOUR_GITHUB_REPO" # Exemple : "btadevops/cloud-native-devops-kubernetes-2e"

  lambda_base_name = "lambda-sample"

  # ⚠️ Remplace par ton bucket S3 et ta table DynamoDB
  tofu_state_bucket = "YOUR_S3_BUCKET_NAME"
  tofu_state_dynamodb_table = "YOUR_DYNAMODB_TABLE_NAME"
}