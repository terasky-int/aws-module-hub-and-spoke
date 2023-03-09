

variable "tgw_name" {
  description = "The name of the Transit Gateway"
  type        = string
  default     = null
}

variable "tgw_tags" {
  description = "Transit gateway tags"
  type        = map(string)
  default     = {}
}

variable "spoke_rt_tags" {
  description = "Transit Gateway Route Table tags"
  type        = map(string)
  default = {
    Name = "spoke_rt"
  }
}
variable "hub_rt_tags" {
  description = "Transit Gateway Route Table tags"
  type        = map(string)
  default = {
    Name = "hub_rt"
  }
}