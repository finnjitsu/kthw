provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {}
}

module "main_vpc" {
  source            = "github.com/finnjitsu/aws-vpc"
  region            = var.region
  stack_name        = var.key
  vpc_cidr          = var.vpc_cidr
  app_subnet_a_cidr = var.app_subnet_a_cidr
  app_subnet_b_cidr = var.app_subnet_b_cidr
  db_subnet_a_cidr  = var.db_subnet_a_cidr
  db_subnet_b_cidr  = var.db_subnet_b_cidr
  web_subnet_a_cidr = var.web_subnet_a_cidr
  web_subnet_b_cidr = var.web_subnet_b_cidr
}

/*module "jenkins" {
  source            = "github.com/finnjitsu/jenkins"
  region            = var.region
  stack_name        = var.key
  ec2_instance_type = "t3.micro"
  root_disk_sz      = "20"
  app_disk_sz       = "20"
  vpc_id            = module.main_vpc.vpc_id
  app_subnet_a_id   = module.main_vpc.app_subnet_a_id
  app_subnet_b_id   = module.main_vpc.app_subnet_b_id
  web_subnet_a_id   = module.main_vpc.web_subnet_a_id
  web_subnet_b_id   = module.main_vpc.web_subnet_b_id
}*/

module "k8s" {
  source            = "github.com/finnjitsu/k8s"
  region            = var.region
  stack_name        = var.key
  ec2_instance_type = "t3.micro"
  root_disk_sz      = "20"
  app_disk_sz       = "20"
  vpc_id            = module.main_vpc.vpc_id
  app_subnet_a_id   = module.main_vpc.app_subnet_a_id
  app_subnet_b_id   = module.main_vpc.app_subnet_b_id
  web_subnet_a_id   = module.main_vpc.web_subnet_a_id
  web_subnet_b_id   = module.main_vpc.web_subnet_b_id
}