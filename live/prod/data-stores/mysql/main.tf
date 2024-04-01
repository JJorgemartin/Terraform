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
  alias  = "primary"
}

provider "aws" {
  region = "us-west-1"
  alias  = "replica"
}

module "mysql_primary" {
  source = "../../../../modules/data-stores/mysql"

  providers = {
    aws = aws.primary
  }

  db_name     = var.db_name

  db_username = var.db_username
  db_password = var.db_password

  # Must be enabled to support replication
  backup_retention_period = 1
}

module "mysql_replica" {
  source = "../../../../modules/data-stores/mysql"

  providers = {
    aws = aws.replica
  }

  # Make this a replica of the primary
  replicate_source_db = module.mysql_primary.arn
}


#data "aws_kms_secrets" "creds" {
#  secret {
#    name = "db"
#    payload = file("${path.module}/db-creds.yml.encrypted")
#  }
#}

#locals {
#  db_creds = yamldecode(data.aws_kms_secrets.creds.plaintext["db"])
#}