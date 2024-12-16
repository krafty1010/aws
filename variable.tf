#project

variable "project" {
  type    = string
  default = "krafty"
}

variable "environment" {
  type = string

}

#VPC

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet_cidrs" {
  description = "CIDR blocks for the subnets"
  type        = list(string)
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

#EC2

variable "enable_ec2" {
  description = "Enable EC2 instance"
  type        = bool
  default     = true
}

variable "key_name" {
  description = "value of the key pair"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string

}

