variable "function_name" {
  description = "The name of the lambda function"
}

variable "runtime" {
  description = "The runtime of the lambda to create"
}

variable "s3_bucket" {
  description = "Dist s3 bucket"
}

variable "s3_key" {
  description = "The filename of the lambda zip in s3 bucket"
}

variable "hash" {
  description = "The file hash"
}

variable "handler" {
  description = "The handler name of the lambda function"
}

variable "role" {
  description = "IAM role attached to the Lambda Function (ARN)"
}

variable "database_uri" {
  description = "Application database_uri"
}

variable "app_config" {
  description = "Application config url"
  default     = "../config/env.py"
}

variable "subnet_ids" {
  description = "Which subnets to associate with lambda"
  type        = "list"
}

variable "security_group_ids" {
  description = "Which security groups to associate with lambda"
  type        = "list"
}
