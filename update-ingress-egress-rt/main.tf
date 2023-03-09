resource "aws_route" "private_rt" {
  count = length(var.private_rt_ids)

  route_table_id         = var.private_rt_ids[count.index]
  destination_cidr_block = var.vpc_cidr
  transit_gateway_id     = var.tgw_id
}

resource "aws_route" "public_rt" {
  count = length(var.public_rt_ids)

  route_table_id         = var.public_rt_ids[count.index]
  destination_cidr_block = var.vpc_cidr
  transit_gateway_id     = var.tgw_id
}