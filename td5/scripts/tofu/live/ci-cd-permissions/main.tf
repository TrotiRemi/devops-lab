provider "aws" {
  region = "us-east-2" # ⚠️ Remplace par ta région AWS si nécessaire
}

module "oidc_provider" {
  source = "git::https://github.com/TrotiRemi/devops-lab.git//td5/scripts/tofu/modules/github-aws-oidc?ref=master"
  provider_url = "https://token.actions.githubusercontent.com"
}

module "iam_roles" {
  source = "../modules/gh-actions-iam-roles" # ⚠️ Vérifie que ce chemin est correct
  name = "lambda-sample"
  oidc_provider_arn = module.oidc_provider.oidc_provider_arn
  enable_iam_role_for_testing = true
  enable_iam_role_for_plan = true
  enable_iam_role_for_apply = true

  # ⚠️ Remplace par ton vrai repo GitHub
  github_repo = "TrotiRemi/devops-lab"

  lambda_base_name = "lambda-sample"

  # ⚠️ Remplace par tes vraies ressources AWS
  tofu_state_bucket = "my-tf-state-bucket"
  tofu_state_dynamodb_table = "my-tf-state-lock"
}
