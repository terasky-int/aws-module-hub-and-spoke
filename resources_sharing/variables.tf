variable "aws_region" {
  description = "Name of the AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "assume_role_name" {
  description = "ARN of an IAM Role to assume"
  type        = string
  default     = null
}

variable "environment" {
  description = "Name of the environment this resource is part of. Valid values include `dev`, `dev-pci`, `qa2`, `qa2-pci`, `qa3`, `qa3-pci`, `prod`, `prod-pci`, `non-prod-shared-resources`, `prod-shared-resources`"
  type        = string

  validation {
    condition     = contains(["dev", "dev-pci", "qa2", "qa2-pci", "qa3", "qa3-pci", "prod", "prod-pci", "non-prod-shared-resources", "prod-shared-resources"], var.environment)
    error_message = "The value for \"environment\" must be one of the following: \"dev\"/\"dev-pci\"/\"qa2\"/\"qa2-pci\"/\"qa3\"/\"qa3-pci\"/\"prod\"/\"prod-pci\"/\"non-prod-shared-resources\"/\"prod-shared-resources\" (case-sensitive)"
  }
}

variable "destination_account" {
  description = "AWS account ID to share the networking resource with"
  type        = string
}

variable "network_account" {
  description = "AWS account ID to share the networking resource with"
  type        = string
}

variable "tgw_id" {
  description = "ID of Transit Gateway to share. If the value is `null` - no Transit Gateway will be shared"
  type        = string
  default     = null
}

variable "vpc_id" {
  description = "ID of Transit Gateway to share. If the value is `null` - no Transit Gateway will be shared"
  type        = string
  default     = null
}

variable "public_workload" {
  description = "Whether the VPC has public subnets and Internet Gateway"
  type        = bool
#  default     = null
}

#variable "subnets" {
#  description = "List of subnets ids to be shared"
#  type        = list(string)
#  default     = null
#}

#variable "default_tags" {
#  description = "List of subnets ids to be shared"
#  type        = map(any)
#  default     = null
#}
#
#variable "vpc_tags" {
#  description = "Map of VPC tags"
#  type        = map(any)
#  default     = null
#}
#
#variable "private_subnets_tags" {
#  description = "Map of Private subnets tags"
#  type        = map(any)
#  default     = null
#}
