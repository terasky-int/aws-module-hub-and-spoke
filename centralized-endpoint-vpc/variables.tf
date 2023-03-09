variable "aws_region" {
  description = "Name of the AWS region"
  type        = string
  default     = "eu-west-1"
}

#variable "assume_role_name" {
#  description = "ARN of an IAM Role to assume"
#  type        = string
#  default     = null
#}
#
#variable "map_server_id" {
#  description = "Server ID that is used to tag your MAP workload to calculate MAP Credits (with the map-migrated tag)"
#  type        = string
#  default     = null
#}
#
#variable "environment" {
#  description = "Name of the environment this resource is part of. Valid values include `dev`, `test`, `poc`, `prod`, `shared-it-services`"
#  type        = string
#
#  validation {
#    condition     = contains(["dev", "test", "poc", "prod", "shared-it-services"], var.environment)
#    error_message = "The value for \"environment\" must be one of the following: \"dev\"/\"test\"/\"poc\"/\"prod\"/\"shared-it-services\"/ (case-sensitive)"
#  }
#}

variable "hub_or_spoke" {
  description = "The VPC role (Hub & Spoke Deployment). Valid values include `hub`, `spoke`"
  type        = string
  default     = "spoke"

  validation {
    condition     = contains(["hub", "spoke"], var.hub_or_spoke)
    error_message = "The value for \"hub_or_spoke\" must be one of the following: \"hub\"/\"spoke\" (case-sensitive)"
  }
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnets IDs which you want to deploy your VPC Endpoint. Applicable for endpoints of type Interface and GatewayLoadBalancer"
  type        = list(string)
  default     = null
}

variable "aws_service" {
  description = "The acronyms of the AWS service which you want to create VPC Endpoint for"
  type        = string
  default     = "s3"
}

variable "vpce_tags" {
  description = "Transit Gateway Attachment subnet tags"
  type        = map(string)
  default = {
    Tier = "VPC-Endpoint-S3"
  }
}