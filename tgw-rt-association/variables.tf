variable "is_inspection" {
  description = "Whether this VPC contains a Firewall or not. Should be true if the VPC contains a Firewall"
  type        = bool
  default     = false
}

#variable "tgw_accept" {
#  description = "Whether to accept the TGW Attachment request. If the request is from the same account it accepts automatically, should be true if it from different account than the tgw"
#  type        = bool
#  default     = true
#}

variable "vpc_name" {
  description = "The VPC name"
  type        = string
}

variable "vpc_cidr" {
  description = "The VPC CIDR Block in order to add it to the Route Table"
  type        = string
}

variable "tgw_attch_id" {
  description = "The id of the Transit Gateway Attachment"
  type        = string
}

variable "tgw_spoke_route_table_id" {
  description = "The id of the TGW Route Table of all VPCs that don't contain a Firewall"
  type        = string
}

variable "tgw_hub_route_table_id" {
  description = "The id of the TGW Route Table of the VPC that contain a Firewall"
  type        = string
}