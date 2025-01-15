variable "project" {
  description = "The project name"
}

variable "environment" {
  description = "The environment name"
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