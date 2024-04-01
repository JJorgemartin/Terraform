provider "aws" {
  region = "us-east-2"
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

resource "aws_db_instance" "example" {
  identifier_prefix = "terraform-up-and-running"
  engine = "mysql"
  allocated_storage = 10
  instance_class = "db.t2.micro"
  skip_final_snapshot = true
  db_name = var.db_name

  #How should we set the username and password

  username = local.db_creds.username
  password = local.db_creds.password
  
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