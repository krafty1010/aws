variable "vpc_cidr" {
  type = string
}

variable "private_subnet_cidrs" {
  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}

variable "region" {
  type = string
}

variable "project" {
}

variable "environment" {
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