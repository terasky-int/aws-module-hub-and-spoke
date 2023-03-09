output "gwlb_id" {
  description = "The ID of the Gateway Load Balancer"
  value       = aws_lb.this.id
}

output "gwlb_arn" {
  description = "The ID of the Gateway Load Balancer"
  value       = aws_lb.this.arn
}

output "gwlb_vpc_endpoint_service_id" {
  description = "The ID of the Gateway Load Balancer VPC Endpoint Service"
  value       = aws_vpc_endpoint_service.this.id
}

output "gwlb_vpc_endpoint_service_arn" {
  description = "The ARN of the Gateway Load Balancer VPC Endpoint Service"
  value       = aws_vpc_endpoint_service.this.arn
}

output "gwlb_vpc_endpoint_service_name" {
  description = "The Name of the Gateway Load Balancer VPC Endpoint Service"
  value       = aws_vpc_endpoint_service.this.service_name
}

output "gwlb_vpc_endpoint_ids" {
  description = "List of IDs of the GWLB VPC Endpoint"
  value       = aws_vpc_endpoint.this[*].id # try(aws_vpc_endpoint.this[*].id, "")
}

output "gwlb_vpc_endpoint_arns" {
  description = "List of ARNs of the GWLB VPC Endpoint"
  value       = try(aws_vpc_endpoint.this[*].arn, "")
}