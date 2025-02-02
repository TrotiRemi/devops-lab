provider "aws" {
  region = "us-east-2" # Remplace avec ta région souhaitée si nécessaire
}

module "oidc_provider" {
  source       = "git::https://github.com/TrotiRemi/devops-lab.git//td5/scripts/tofu/modules/github-aws-oidc"
  provider_url = "https://token.actions.githubusercontent.com"
}

module "iam_roles" {
  source                      = "github.com/TrotiRemi/devops-lab//td5/scripts/tofu/modules/gh-actions-iam-roles"
  name                        = "lambda-sample"
  oidc_provider_arn           = module.oidc_provider.oidc_provider_arn
  enable_iam_role_for_testing = true
  enable_iam_role_for_plan    = true # Ajout pour le rôle de plan
  enable_iam_role_for_apply   = true # Ajout pour le rôle d'application

  # Remplace avec ton propre repo GitHub
  github_repo = "TrotiRemi/devops-lab"

  lambda_base_name          = "lambda-sample"
  tofu_state_bucket         = "nom-de-ton-s3-bucket" # Remplace avec le vrai nom du bucket
  tofu_state_dynamodb_table = "nom-de-ta-dynamodb-table" # Remplace avec le vrai nom de ta table DynamoDB
}
