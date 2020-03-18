module "aws-vpc" {
  source = "github.com/finnjitsu/aws-vpc?ref=develop"
  cidr   = var.cidr
}