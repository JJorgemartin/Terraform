provider "aws" {
  region = "us-east-2"
}

module "users" {
  source = "../../../modules/landing-zone/iam-user"
  count = length(var.user_names)
  user_name = var.user_names[count.index]
}



