provider "aws" {
  region = "us-east-2"
}

# This was the old identifier for the security group. Below is the same security group, but with the new identifier.
# resource "aws_security_group" "instance" {
#   name = var.security_group_name
# }

resource "aws_security_group" "cluster_instance" {
  name = var.security_group_name
}

# Automatically update state to handle the security group's identifier being changed
moved {
  from = aws_security_group.instance
  to   = aws_security_group.cluster_instance
}