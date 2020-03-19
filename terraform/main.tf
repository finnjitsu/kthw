provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {}
}

module "aws-vpc" {
  source            = "github.com/finnjitsu/aws-vpc"
  region            = var.region
  stack_name        = var.key
  vpc_cidr          = var.vpc_cidr
  app_subnet_a_cidr = var.app_subnet_a_cidr
  app_subnet_b_cidr = var.app_subnet_b_cidr
}