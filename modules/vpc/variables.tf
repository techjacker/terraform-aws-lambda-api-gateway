variable "name" {
  description = "Name of the VPC."
}

variable "environment" {
  description = "Environment we are working with."
}

variable "enable_dns_support" {
  description = "True if you want to use private DNS within the VPC."
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Try if you want to use private hostname within the VPC."
  default     = true
}

variable "vpc_cidr" {
  description = "CIDR for VPC."
  default     = "10.100.0.0/16"
}

variable "public_subnets_cidr" {
  description = "CIDR for public subnets."

  type = "list"

  default = [
    "10.100.10.0/24",
    "10.100.20.0/24",
  ]
}

variable "private_subnets_cidr" {
  description = "CIDR for private subnets"

  type = "list"

  default = [
    "10.100.30.0/24",
    "10.100.40.0/24",
  ]
}

variable "nat_cidr" {
  type = "list"
}

variable "igw_cidr" {}

variable "azs" {
  description = "Avaialbility Zones for Subnets. Indexes must match `public_subnets_cidr`"
  type        = "list"
}

variable "map_public_ip_on_launch" {
  description = "Set try if you want to map the public IP on launch."
  default     = true
}

variable "service" {}
variable "project" {}
variable "owner" {}
variable "costcenter" {}
