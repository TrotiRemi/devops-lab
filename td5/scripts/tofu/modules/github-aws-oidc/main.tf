provider "aws" {
region = "us-east-2" # Replace with your desired region
}
module "oidc_provider" {
  source = "github.com/your_github_name/devopsbase//td5/scripts/tofu/modules/github-aws-oidc"
provider_url = "https://token.actions.githubusercontent.com"
}

