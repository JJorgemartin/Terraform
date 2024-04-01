terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  #terraform {
  #  backend "s3" {
  #	bucket = "jjterraform-up-and-running-state"
  #	key = "live/prod/data-store/mysql/terraform.tfstate"
  #	region = "us-east-2"
  #	dynamodb_table = "terraform-up-and-running-locks"
  #	encrypt = true
  #  }
  #}
}

provider "aws" {
  region = "us-east-2"
}


module "mysql" {
  source = "../../../../modules/data-stores/mysql"

  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}