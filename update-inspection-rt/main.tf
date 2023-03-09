############################
# Global
############################

resource "aws_route" "inspection_private_rt" {
  count = length(var.inspection_private_rt_ids)

  route_table_id         = var.inspection_private_rt_ids[count.index]
  destination_cidr_block = var.vpc_cidr
  transit_gateway_id     = var.tgw_id
}

############################
# With GWLB
############################

resource "aws_route" "inspection_tgw_rt_gwlb" {
  count = var.create_gwlb ? length(var.inspection_tgw_rt_ids) : 0

  route_table_id         = var.inspection_tgw_rt_ids[count.index]
  destination_cidr_block = "0.0.0.0/0"
  vpc_endpoint_id        = var.gwlb_endpoint_ids[count.index]
}

resource "aws_route" "inspection_public_rt_gwlb" {
  count = var.create_gwlb ? length(var.inspection_public_rt_ids) : 0

  route_table_id         = var.inspection_public_rt_ids[count.index]
  destination_cidr_block = var.vpc_cidr
  vpc_endpoint_id        = var.gwlb_endpoint_ids[count.index]
}

############################
# With AWS Network Firewall
############################

resource "aws_route" "inspection_tgw_rt_aws_fw" {
  count = var.create_aws_fw ? length(var.inspection_tgw_rt_ids) : 0

  route_table_id         = var.inspection_tgw_rt_ids[count.index]
  destination_cidr_block = "0.0.0.0/0"
  vpc_endpoint_id        = var.aws_fw_endpoint_ids[count.index]
}

resource "aws_route" "inspection_public_rt_aws_fw" {
  count = var.create_aws_fw ? length(var.inspection_public_rt_ids) : 0

  route_table_id         = var.inspection_public_rt_ids[count.index]
  destination_cidr_block = var.vpc_cidr
  vpc_endpoint_id        = var.aws_fw_endpoint_ids[count.index]
}