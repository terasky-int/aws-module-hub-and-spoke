locals {
  availability_zones_names = slice(data.aws_availability_zones.available.names, 0, max(length(var.private_subnets)))
}

data "aws_availability_zones" "available" {
  state = "available"
}

# The GWLB
resource "aws_lb" "this" {
  name                             = var.gwlb_name
  load_balancer_type               = "gateway"
  enable_cross_zone_load_balancing = true
  subnets                          = var.private_subnets
  tags                             = var.gwlb_tags

  lifecycle {
    create_before_destroy = true
  }
}

# The Service which accepts traffic from Endpoints ("clients") located on any VPCs. One service is possible per one gwlb.
resource "aws_vpc_endpoint_service" "this" {
  acceptance_required        = true
  gateway_load_balancer_arns = [aws_lb.this.arn]

  tags = {
    Name = "Inspection-VPC-Endpoint-Service-GWLB"
    Type = "gateway-load-balancer"
  }

  # Workaround for: error waiting for VPC Endpoint to become available: VPC Endpoint is in a failed state
  depends_on = [aws_lb.this]
}

resource "aws_vpc_endpoint" "this" {
  count = length(var.private_subnets)

  service_name      = aws_vpc_endpoint_service.this.service_name
  vpc_endpoint_type = aws_vpc_endpoint_service.this.service_type
  vpc_id            = var.vpc_id

  tags = {
    Name = "${var.vpc_name}-VPC-Endpoint-GWLB-${local.availability_zones_names[count.index]}"
    Type = "gateway-load-balancer"
    AZ   = local.availability_zones_names[count.index]
  }
}

resource "aws_vpc_endpoint_connection_accepter" "this" {
  count = length(aws_vpc_endpoint.this)

  vpc_endpoint_service_id = aws_vpc_endpoint_service.this.id
  vpc_endpoint_id         = aws_vpc_endpoint.this[count.index].id
}

resource "aws_vpc_endpoint_subnet_association" "this" {
  count = length(var.private_subnets)

  vpc_endpoint_id = aws_vpc_endpoint.this[count.index].id
  subnet_id       = var.private_subnets[count.index]
}

resource "aws_route" "tgw_attachment_rt_all_to_vpce" {
  count = length(var.tgw_route_table_ids)

  route_table_id         = var.tgw_route_table_ids[count.index]
  destination_cidr_block = "0.0.0.0/0"
  vpc_endpoint_id        = aws_vpc_endpoint.this[count.index].id

  depends_on = [aws_vpc_endpoint_connection_accepter.this, aws_vpc_endpoint_subnet_association.this]
}
