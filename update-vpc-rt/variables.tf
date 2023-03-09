variable "tgw_id" {
  description = "The ID of the Transit Gateway"
  type        = string
}

variable "private_route_table_ids" {
  description = "List of Private Route Tables IDs"
  type        = list(string)
}

variable "tgw_route_table_ids" {
  description = "List of TGW Attachments Route Tables IDs"
  type        = list(string)
}