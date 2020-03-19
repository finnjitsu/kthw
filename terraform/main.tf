provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {}
}

module "aws-vpc" {
  source = "github.com/finnjitsu/aws-vpc"
  region   = var.region
  cidr     = var.vpc_cidr
  vpc_name = var.key
  app_subnet_a_name = var.app_subnet_a_name
  app_subnet_a_cidr = var.app_subnet_a_cidr
  app_subnet_b_name = var.app_subnet_b_name
  app_subnet_b_cidr = var.app_subnet_b_cidr
}