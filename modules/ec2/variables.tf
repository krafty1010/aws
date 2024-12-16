variable "key_name" {
  description = "The key name to use for the EC2 instance"
}

variable "project" {
  description = "The project name"
}

variable "environment" {
  description = "The project name"
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
