variable "tgw_id" {
  description = "The id of the TGW"
  type        = string
}

variable "vpc_cidr" {
  description = "The VPC CIDR Block in order to add it to the Route Table"
  type        = string
}

variable "private_rt_ids" {
  description = "List of the Private Route Table IDs"
  type        = list(string)
}

variable "public_rt_ids" {
  description = "List of the Public Route Table IDs"
  type        = list(string)
}