terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

module "eks_cluster" {
  source = "../modules/services/eks-cluster"

  name = "example-eks-cluster"
  min_size = 1
  max_size = 2
  desired_size = 1

  instance_types = [ "t3.small" ]
}

provider "kubernetes" {
  host = module.eks_cluster.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks_cluster_auth.cluster.token)
  token = data.aws_eks_cluster_auth.cluster.token
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks_cluster.cluster_name
}

module "simple_webapp" {
  source = "../modules/services/k8s-app"

  name = "simple-webapp"
  image = "training/webapp"
  replicas = 2
  container_port = 5000

  enviroment_variables = {
    PROVIDER = "Terraform"
  }

  #Only deploy the app after the cluster has been deployed

  depends_on = [ module.eks_cluster ]
}