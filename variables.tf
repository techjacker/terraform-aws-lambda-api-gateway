####################
# Tags
####################
variable "project" {
  description = "Project name for tags and resource naming"
}

variable "owner" {
  description = "Contact person responsible for the resource"
}

variable "costcenter" {
  description = "Cost Center tag"
}

variable "service" {
  description = "Service name"
}

####################
# VPC
####################
variable vpc_cidr {
  description = "VPC CIDR"
}

variable igw_cidr {
  description = "VPC Internet Gateway CIDR"
}

variable public_subnets_cidr {
  description = "Public Subnets CIDR"
  type        = "list"
}

variable private_subnets_cidr {
  description = "Private Subnets CIDR"
  type        = "list"
}

variable nat_cidr {
  description = "VPC NAT Gateway CIDR"
  type        = "list"
}

variable azs {
  description = "VPC Availability Zones"
  type        = "list"
}

####################
# Lambda
####################
variable "lambda_runtime" {
  description = "Lambda Function runtime"
}

variable "lambda_zip_path" {
  description = "Lambda Function Zipfile local path for S3 Upload"
}

variable "lambda_function_name" {
  description = "Lambda Function Name"
  default     = "HttpServer"
}

variable "lambda_handler" {
  description = "Lambda Function Handler"
}

variable "lambda_memory" {
  description = "Lambda memory size, 128 MB to 3,008 MB, in 64 MB increments"
  default = "128"
}

####################
# API Gateway
####################
variable "region" {
  description = "Region in which to deploy the API"
}

variable "account_id" {
  description = "Account ID needed to construct ARN to allow API Gateway to invoke lambda function"
}
