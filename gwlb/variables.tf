variable "gwlb_name" {
  description = "The name of the Gateway Load Balancer"
  type        = string
  default     = ""
}

variable "vpc_name" {
  description = "The name of the VPC where you want to deploy the Gateway Load Balancer"
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "The ID of the VPC where you want to deploy the Gateway Load Balancer"
  type        = string
  default     = ""
}

variable "private_subnets" {
  description = "List of IDs of private subnets"
  type        = list(string)
  default     = []
}

variable "gwlb_tags" {
  description = "Public subnet tags"
  type        = map(string)
  default     = {}
}

variable "endpoint_service_tags" {
  description = "Public subnet tags"
  type        = map(string)
  default     = {}
}

variable "tgw_route_table_ids" {
  description = "List of TGW Attachments' Route Tables IDs"
  type        = list(string)
  default     = []
}