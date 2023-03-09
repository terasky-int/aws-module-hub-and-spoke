variable "create_gwlb" {
  description = "Whether there is a AWS Gateway Load Balancer presented in the environment"
  type        = bool
  default     = false
}

variable "create_aws_fw" {
  description = "Whether there is a AWS Network Firewall presented in the environment"
  type        = bool
  default     = false
}

variable "tgw_id" {
  description = "The id of the TGW"
  type        = string
  default     = ""
}

variable "vpc_cidr" {
  description = "The VPC CIDR Block in order to add it to the Route Table"
  type        = string
  default     = ""
}

variable "inspection_tgw_rt_ids" {
  description = "List of the Inspection VPC TGW Route Table IDs"
  type        = list(string)
  default     = []
}

variable "inspection_private_rt_ids" {
  description = "List of the Inspection VPC Private Route Table IDs"
  type        = list(string)
  default     = []
}

variable "inspection_public_rt_ids" {
  description = "List of the Inspection VPC Public Route Table IDs"
  type        = list(string)
  default     = []
}

variable "gwlb_endpoint_ids" {
  description = "List of the Gateway Load Balancer VPC Endpoints IDs"
  type        = list(string)
  default     = []
}

variable "aws_fw_endpoint_ids" {
  description = "List of the AWS Network Firewall Endpoints IDs"
  type        = list(string)
  default     = []
}