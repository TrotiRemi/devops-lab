provider "aws" {
    region = "us-east-2" # Your AWS region
}
module "state" {
    source = "git::https://github.com/TrotiRemi/devops-lab.git//td5/scripts/tofu/modules/state-bucket?ref=master"
    name = "devops-lab-troti-remi-2025" # Replace with a unique name
}
