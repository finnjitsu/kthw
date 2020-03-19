variable "bucket" {
  type        = string
  description = "Name of the remote s3 bucket and dynamodb locking table."
}

variable "key" {
  type        = string
  description = "Key/path for the terraform remote state file and locking table."
}

variable "dynamodb_table" {
  type        = string
  description = "Name of the terraform remote state dynamodb locking table."
}

variable "encrypt" {
  type        = bool
  description = "Is the terraform state file encrypted?"
}

variable "region" {
  type        = string
  description = "Region where the AWS resources will live."
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC."
}

variable "app_subnet_a_cidr" {
  type        = string
  description = "CIDR block for the first app tier subnet."
}

variable "app_subnet_b_cidr" {
  type        = string
  description = "CIDR block for the second app tier subnet."
}