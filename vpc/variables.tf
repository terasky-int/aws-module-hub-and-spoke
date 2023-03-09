# variable "create_vpc" {
#   description = "Create a vpc"
#   type = bool
#   default = true
# }

variable "vpc_name" {
  description = "The vpc name"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true # The VPC must have DNS hostname and DNS resolution support. Otherwise, EKS nodes can't register their cluster
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true # The VPC must have DNS hostname and DNS resolution support. Otherwise, EKS nodes can't register their cluster
}

variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  type        = bool
  default     = false
}

variable "single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  type        = bool
  default     = false
}
variable "one_nat_gateway_per_az" {
  description = "Should be true if you want to provision a NAT Gateway per AZ"
  type        = bool
  default     = false
}

variable "nat_gateway_destination_cidr_block" {
  description = "Used to pass a custom destination route for private NAT Gateway. If not specified, the default 0.0.0.0/0 is used as a destination route"
  type        = string
  default     = "0.0.0.0/0"
}

variable "enable_s3_endpoint" {
  description = "Should be true if you want to provision an S3 endpoint to the VPC"
  type        = bool
  default     = false
}

variable "firewall_subnet_cidrs" {
  description = "A list of CIDRs for firewall subnets. Use the `firewall_subnet_network_start` variable to dynamically calculate the network CIDRs"
  type        = list(string)
  default     = []
}

variable "firewall_subnet_count" {
  description = "Number of firewall subnets to create (for dynamic calculation of network CIDRs)"
  type        = number
  default     = 0
}

variable "firewall_subnet_network_start" {
  description = "Firewall subnet network (third octet) to dynamically calculate the network CIDRs. Use `firewall_subnets_cidrs` to provide the network CIDRs manually"
  type        = number
  default     = 1
}

variable "firewall_subnet_suffix" {
  description = "Firewall subnet suffix"
  type        = string
  default     = "firewall_endpoint"
}

variable "firewall_subnet_tags" {
  description = "Firewall subnet tags"
  type        = map(string)
  default = {
    Tier = "firewall"
  }
}

variable "firewall_route_table_tags" {
  description = "Firewall route tables tags"
  type        = map(string)
  default = {
    Tier = "firewall"
  }
}

variable "public_subnet_cidrs" {
  description = "A list of CIDRs for public subnets. Use the `public_subnet_network_start` variable to dynamically calculate the network CIDRs"
  type        = list(string)
  default     = []
}

variable "public_subnet_count" {
  description = "Number of public subnets to create (for dynamic calculation of network CIDRs)"
  type        = number
  default     = 0
}

variable "public_subnet_network_start" {
  description = "Public subnet network (third octet) to dynamically calculate the network CIDRs. Use `public_subnets_cidrs` to provide the network CIDRs manually"
  type        = number
  default     = 1
}

variable "public_subnet_suffix" {
  description = "Public subnet suffix"
  type        = string
  default     = "public"
}

variable "public_subnet_tags" {
  description = "Public subnet tags"
  type        = map(string)
  default = {
    Tier = "public"
  }
}

variable "public_route_table_tags" {
  description = "Public route tables tags"
  type        = map(string)
  default = {
    Tier = "public"
  }
}

variable "private_subnet_cidrs" {
  description = "A list of CIDRs for private subnets. Use the `private_subnet_network_start` variable to dynamically calculate the network CIDRs"
  type        = list(string)
  default     = []
}

variable "private_subnet_count" {
  description = "Number of private subnets to create (for dynamic calculation of network CIDRs)"
  type        = number
  default     = 0
}

variable "private_subnet_network_start" {
  description = "Private subnet network (third octet) to dynamically calculate the network CIDRs. Use `private_subnets_cidrs` to provide the network CIDRs manually"
  type        = number
  default     = 101
}

variable "private_subnet_suffix" {
  description = "Private subnet suffix"
  type        = string
  default     = "private"
}

variable "private_subnet_tags" {
  description = "Private subnet tags"
  type        = map(string)
  default = {
    Tier = "private"
  }
}

variable "private_route_table_tags" {
  description = "private route tables tags"
  type        = map(string)
  default = {
    Tier = "private"
  }
}

variable "database_subnet_cidrs" {
  description = "A list of CIDRs for database subnets. Use the `database_subnet_network_start` variable to dynamically calculate the network CIDRs"
  type        = list(string)
  default     = []
}

variable "database_subnet_count" {
  description = "Number of database subnets to create (for dynamic calculation of network CIDRs)"
  type        = number
  default     = 0
}

variable "database_subnet_network_start" {
  description = "Database subnet network (third octet) to dynamically calculate the network CIDRs. Use `database_subnets_cidrs` to provide the network CIDRs manually"
  type        = number
  default     = 201
}

variable "database_subnet_suffix" {
  description = "Database subnet suffix"
  type        = string
  default     = "database"
}

variable "database_subnet_tags" {
  description = "Database subnet tags"
  type        = map(string)
  default = {
    Tier = "database"
  }
}

variable "create_database_subnet_group" {
  description = "Controls if database subnet group should be created (n.b. `database_subnet_cidrs` or  `database_subnet_count` must also be set)"
  type        = bool
  default     = false
}

variable "tgw_subnet_cidrs" {
  description = "A list of CIDRs for Transit Gateway Attachment subnets. Use the `tgw_subnet_network_start` variable to dynamically calculate the network CIDRs"
  type        = list(string)
  default     = []
}

variable "tgw_subnet_count" {
  description = "Number of Transit Gateway Attachment subnets to create (for dynamic calculation of network CIDRs)"
  type        = number
  default     = 0
}

variable "tgw_subnet_network_start" {
  description = "Transit Gateway Attachment subnet network (third octet) to dynamically calculate the network CIDRs. Use `tgw_subnets_cidrs` to provide the network CIDRs manually"
  type        = number
  default     = 3840 # CIDR: X.X.240.0/28
}

variable "tgw_subnet_suffix" {
  description = "Transit Gateway Attachment subnet suffix"
  type        = string
  default     = "tgw-attachment"
}

variable "tgw_subnet_tags" {
  description = "Transit Gateway Attachment subnet tags"
  type        = map(string)
  default = {
    Tier = "tgw-attachment"
  }
}

variable "tgw_route_table_tags" {
  description = "Transit Gateway Attachment route tables tags"
  type        = map(string)
  default = {
    Tier = "tgw-attachment"
  }
}

variable "enable_flow_log" {
  description = "Whether or not to enable VPC Flow Logs"
  type        = bool
  default     = false
}

variable "flow_log_traffic_type" {
  description = "The type of traffic to capture. Valid values: ACCEPT, REJECT, ALL"
  type        = string
  default     = "ALL"
}

variable "flow_log_destination_type" {
  description = "Type of flow log destination. Can be s3 or cloud-watch-logs"
  type        = string
  default     = "s3"
}

variable "flow_log_log_format" {
  description = "The fields to include in the flow log record, in the order in which they should appear"
  type        = string
  default     = null
}

variable "flow_log_destination_arn" {
  description = "The ARN of the S3 bucket where VPC Flow Logs will be pushed. If this ARN is a S3 bucket the appropriate permissions need to be set on that bucket's policy"
  type        = string
  default     = ""
}

variable "flow_log_max_aggregation_interval" {
  description = "The maximum interval of time during which a flow of packets is captured and aggregated into a flow log record. Valid Values: `60` seconds or `600` seconds."
  type        = number
  default     = 600
}

variable "vpc_tags" {
  description = "Additional tags for the deployed resources"
  type        = map(string)
  default     = {}
}