##################
# Transit Gateway
##################

resource "aws_ec2_transit_gateway" "tgw" {
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"

  tags = var.tgw_tags
}

#####################
# TGW Routing Tables
#####################

##################################
# Spoke RT (All -> Inspection VPC)
##################################
resource "aws_ec2_transit_gateway_route_table" "spoke" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id

  tags = var.spoke_rt_tags
}

#####################################################################
# Hub RT [Traffic after inspection (in Inspection VPC) -> target VPC]
#####################################################################
resource "aws_ec2_transit_gateway_route_table" "hub" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id

  tags = var.hub_rt_tags
}

##############################
# Resource Access Share (RAM)
##############################

data "aws_organizations_organization" "this" {}

resource "aws_ram_resource_share" "tgw" {
  name                      = var.tgw_name
  allow_external_principals = true

  tags = var.tgw_tags
}

resource "aws_ram_principal_association" "tgw" {
  principal          = data.aws_organizations_organization.this.arn # var.org_arn
  resource_share_arn = aws_ram_resource_share.tgw.arn
}

resource "aws_ram_resource_association" "tgw" {
  resource_arn       = aws_ec2_transit_gateway.tgw.arn
  resource_share_arn = aws_ram_resource_share.tgw.arn
}