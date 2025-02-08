variable "project" {
  description = "my project"
}

variable "environment" {
  description = "The environment name"
}

variable "region" {
  description = "The AWS region name"
}

variable "vpc_id" {
}

variable "private_subnet_ids" {
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