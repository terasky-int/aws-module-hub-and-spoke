output "firewall_subnets" {
  description = "List of firewall subnets cidrs"
  value       = module.vpc.firewall_subnets
}

output "firewall_route_table_ids" {
  description = "List of IDs of firewall subnets"
  value       = module.vpc.firewall_route_table_ids
}

output "public_subnets_cidrs_block" {
  description = "List of public subnets cidrs"
  value       = module.vpc.public_subnets_cidr_blocks
}

output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = module.vpc.igw_id
}

output "igw_arn" {
  description = "The ID of the Internet Gateway"
  value       = module.vpc.igw_arn
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = module.vpc.vpc_arn
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr" {
  description = "The CIDR Block of the VPC"
  value       = var.vpc_cidr
}

output "name" {
  description = "The name of the VPC"
  value       = module.vpc.name
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "private_subnet_arns" {
  description = "List of ARNs of private subnets"
  value       = module.vpc.private_subnet_arns
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "database_subnets" {
  description = "List of IDs of database subnets"
  value       = module.vpc.database_subnets
}

output "tgw_subnets" {
  description = "List of IDs of Transit Gateway Attachment subnets"
  value       = module.vpc.intra_subnets
}

output "tgw_route_table_ids" {
  description = "List of IDs of Transit Gateway Attachment route tables"
  value       = module.vpc.intra_route_table_ids
}

output "private_route_table_ids" {
  description = "List of IDs of Private route tables"
  value       = module.vpc.private_route_table_ids
}

output "public_route_table_ids" {
  description = "List of IDs of Private route tables"
  value       = module.vpc.public_route_table_ids
}

output "vpc_tags" {
  value = module.vpc.vpc_tags
}

output "tgw_subnets_tags" {
  value = module.vpc.intra_subnets_tags
}

output "private_subnets_tags" {
  value = module.vpc.private_subnets_tags
}

output "public_subnets_tags" {
  value = module.vpc.public_subnets_tags
}

output "db_subnets_tags" {
  value = module.vpc.db_subnets_tags
}

output "redshift_subnets_tags" {
  value = module.vpc.redshift_subnets_tags
}

output "elasticache_subnets_tags" {
  value = module.vpc.elasticache_subnets_tags
}

output "outpost_subnets_tags" {
  value = module.vpc.outpost_subnets_tags
}

