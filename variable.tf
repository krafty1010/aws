#project

variable "project" {
  type    = string
  default = "krafty"
}

variable "environment" {
  type = string
}

variable "region" {
  description = "AWS region"
  type        = string
}


#VPC module

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet_cidrs" {
  description = "CIDR blocks for the subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

#EC2 module

variable "enable_ec2" {
  description = "Enable EC2 instance"
  type        = bool
  default     = true
}

#EKS module

variable "enable_eks" {
  description = "Enable EKS instance"
  type        = bool
  default     = false
}

variable "eks_instance_type" {
  description = "Enable EKS instance"
  type        = string
  default     = false
}
