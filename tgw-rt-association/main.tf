### Accept the TGW attachment request *** on the network account ***
#resource "aws_ec2_transit_gateway_vpc_attachment_accepter" "vpc" {
#  count = var.tgw_accept ? 1 : 0
##  count = var.is_inspection ? 0 : 1
#
#  transit_gateway_attachment_id                   = var.tgw_attch_id
#  transit_gateway_default_route_table_association = false
#  transit_gateway_default_route_table_propagation = false
#
#  tags = {
#    Name = format("%s-TGW-Attachment", var.vpc_name)
#  }
#}

##################################################
# route_table_association - Spoke RT Association
##################################################

resource "aws_ec2_transit_gateway_route_table_association" "spoke_rt" {
  count = var.is_inspection ? 0 : 1

  transit_gateway_attachment_id  = var.tgw_attch_id
  transit_gateway_route_table_id = var.tgw_spoke_route_table_id

#  depends_on = [aws_ec2_transit_gateway_vpc_attachment_accepter.vpc]
}

############################################################################################
# Update routes - on the Hub RT [Traffic after inspection (in Inspection VPC) -> target VPC]
############################################################################################

resource "aws_ec2_transit_gateway_route" "spoke_vpc_cidr" {
  count = var.is_inspection ? 0 : 1

  destination_cidr_block         = var.vpc_cidr
  transit_gateway_attachment_id  = var.tgw_attch_id
  transit_gateway_route_table_id = var.tgw_hub_route_table_id

  # need to check whether this depends_on is necessary or not
  depends_on = [aws_ec2_transit_gateway_route_table_association.spoke_rt]
}

##################################################
# route_table_association - Hub RT Association
##################################################

resource "aws_ec2_transit_gateway_route_table_association" "hub_rt" {
  count = var.is_inspection ? 1 : 0

  transit_gateway_attachment_id  = var.tgw_attch_id
  transit_gateway_route_table_id = var.tgw_hub_route_table_id

#  depends_on = [aws_ec2_transit_gateway_vpc_attachment_accepter.vpc]
}

############################################################################################
# Update routes - on the TGW Spoke RT [All traffic go to Inspection VPC]
############################################################################################

resource "aws_ec2_transit_gateway_route" "all_to_inspection_vpc" {
  count = var.is_inspection ? 1 : 0

  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_attachment_id  = var.tgw_attch_id
  transit_gateway_route_table_id = var.tgw_spoke_route_table_id

  # need to check whether this depends_on is necessary or not
  depends_on = [aws_ec2_transit_gateway_route_table_association.hub_rt]
}