##############################################################################################################
# Update Route Tables to forward all requests into the central TGW (relevant to all VPCs but Inspection VPC)
##############################################################################################################

resource "aws_route" "tgw_attach_rt_all_to_tgw" {
  count = length(var.tgw_route_table_ids)

  route_table_id         = var.tgw_route_table_ids[count.index]
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id     = var.tgw_id
}

resource "aws_route" "private_rt_all_to_tgw" {
  count = length(var.private_route_table_ids)

  route_table_id         = var.private_route_table_ids[count.index]
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id     = var.tgw_id
}