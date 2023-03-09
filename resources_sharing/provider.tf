terraform {
  required_version = ">= 0.15.0"

  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "~> 4.0"
      configuration_aliases = [aws.network, aws.dest]
    }
  }
}

#provider "aws" {
#  region = var.aws_region
#  alias  = "dest"
#
#  dynamic "assume_role" {
#    for_each = var.destination_account != null && var.assume_role_name != null ? ["arn:aws:iam::${var.destination_account}:role/${var.assume_role_name}"] : []
#    content {
#      role_arn = assume_role.value
#    }
#  }
#}
