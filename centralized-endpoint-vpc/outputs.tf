output "vpc_endpoint_ids" {
  description = "List of IDs of the VPC Endpoints"
  value       = aws_vpc_endpoint.this[*].id # aws_vpc_endpoint.this[*].id, "")
}

output "vpc_endpoint_arn" {
  description = "The ARN of the VPC Endpoint"
  value       = try(aws_vpc_endpoint.this[0].arn, "")
}

output "vpc_endpoint_dns" {
  description = "The DNS Record of the VPC Endpoint"
  value       = try(aws_vpc_endpoint.this[0].dns_entry, "")
}

output "vpc_endpoint_subnets_ids" {
  description = "List of the Subnets IDs of the VPC Endpoint"
  value       = try(aws_vpc_endpoint.this[0].subnet_ids, "")
}

output "vpc_endpoint_eni_ids" {
  description = "List of the Network Interface IDs of the VPC Endpoint"
  value       = try(aws_vpc_endpoint.this[0].network_interface_ids, "")
}

output "aws_route53_zone_id" {
  description = "The ID of the Route53 Private Hosted Zone"
  value       = try(aws_route53_zone.private[0].zone_id, "")
}

output "aws_route53_zone_arn" {
  description = "The ARN of the Route53 Private Hosted Zone"
  value       = try(aws_route53_zone.private[0].arn, "")
}

output "aws_route53_record_id" {
  description = "The ID of the Route53 record"
  value       = try(aws_route53_record.vpc_endpoint_alias[0].id, "")
}

## can't complete the vpc association because module cannot contain provider.tf
#output "aws_route53_zone_association_id" {
#  description = "The ID of the Route53 VPC association"
#  value       = try(aws_route53_zone_association.spoke_vpc[0].id, "")
#}