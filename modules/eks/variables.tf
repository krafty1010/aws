variable "project" {
  description = "my project"
}

variable "environment" {
  description = "The environment name"
}

variable "region" {
  description = "The AWS region name"
}

locals {
  resource_prefix = "${var.project}-${var.environment}"

  tags = {
    environment = var.environment
    project     = var.project
    name        = "${local.resource_prefix}-${random_string.suffix.result}"
  }
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}

variable "vpc" {
}

variable "private_subnets" {
}

variable "eks_instance_type" {
  description = "EKS instance type"
  type        = string
}