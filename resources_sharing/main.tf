#####################################################
# Data Sources
#####################################################

data "aws_default_tags" "default" {}

data "aws_vpc" "selected" {
  id = var.vpc_id
  tags = merge(
    data.aws_default_tags.default.tags,
    {
      Environment = var.environment
    }
  )
}

data "aws_subnets" "all" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

data "aws_subnet" "all" {
  for_each = toset(data.aws_subnets.all.ids)
  id       = each.value
}

#data "aws_ec2_transit_gateway" "selected" {
#  provider = aws.network
#  count = var.tgw_id != null ? 1 : 0
#
#  id = var.tgw_id
#}

data "aws_ec2_transit_gateway" "selected" {
  filter {
    name   = "owner-id"
    values = [var.network_account]
  }
}

#####################################################
# Share networking resources (using RAM)
#####################################################

### Subnets ###

resource "aws_ram_resource_share" "subnets" {
  provider = aws.network

  name                      = join("-", [var.environment, "subnets"])
  allow_external_principals = false
}

resource "aws_ram_resource_association" "subnets" {
  provider = aws.network
#  count = length(var.subnets)
  for_each = { for s in data.aws_subnet.all : s.id => s.arn }

  resource_arn       = each.value # var.subnets[count.index]
  resource_share_arn = aws_ram_resource_share.subnets.arn
}

resource "aws_ram_principal_association" "subnets" {
  provider = aws.network

  principal          = var.destination_account
  resource_share_arn = aws_ram_resource_share.subnets.arn
}

### Transit Gateway ###

resource "aws_ram_resource_share" "tgw" {
  provider = aws.network
  count = var.tgw_id != null ? 1 : 0

  name                      = join("-", [var.environment, "tgw"])
  allow_external_principals = false
}

resource "aws_ram_resource_association" "tgw" {
  provider = aws.network
  count = var.tgw_id != null ? 1 : 0

  resource_arn       = data.aws_ec2_transit_gateway.selected.arn
  resource_share_arn = aws_ram_resource_share.tgw[0].arn
}

resource "aws_ram_principal_association" "tgw" {
  provider = aws.network
  count = var.tgw_id != null ? 1 : 0

  principal          = var.destination_account
  resource_share_arn = aws_ram_resource_share.tgw[0].arn
}

#####################################################
# Attach tags to shared resources
#####################################################

### VPC ###
resource "aws_ec2_tag" "vpc" {
  provider = aws.dest
  for_each = data.aws_vpc.selected.tags
#  for_each = var.default_tags
#  for_each = var.vpc_tags

  resource_id = data.aws_vpc.selected.id
#  resource_id = var.vpc_id
  key         = each.key
  value       = each.value

  depends_on = [
    aws_ram_principal_association.subnets,
    aws_ram_resource_association.subnets
  ]
}

## Internet Gateway ###
data "aws_internet_gateway" "selected" {
  count = var.public_workload ? 1 : 0
  filter {
    name   = "attachment.vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

resource "aws_ec2_tag" "igw" {
  provider = aws.dest
  for_each = var.public_workload ? data.aws_internet_gateway.selected[0].tags : 0

  resource_id = data.aws_internet_gateway.selected[0].internet_gateway_id
  key         = each.key
  value       = each.value

  depends_on = [
    aws_ram_principal_association.subnets,
    aws_ram_resource_association.subnets
  ]
}

#locals {
#  private_subnets_tags = flatten([
#    for s in var.subnets : [
#      for k, v in var.private_subnets_tags : {
#        resource_id = s.id,
#        key         = k,
#        value       = v
#  }]])
#}

#### Subnets ###
#resource "aws_ec2_tag" "subnets" {
#  provider = aws.dest
#  count = length(local.private_subnets_tags) # length(keys(local.private_subnets_tags))
#
#  resource_id = local.private_subnets_tags[count.index]["resource_id"]
#  key         = local.private_subnets_tags[count.index]["key"]
#  value       = local.private_subnets_tags[count.index]["value"]
#}

resource "aws_ec2_tag" "subnets" {
  provider = aws.dest
  # This loop will create a new map which contains each subnet ID and its tags
  for_each = {
    for subnet_tag in flatten([
      for s in data.aws_subnet.all : [
        for k, v in s.tags : {
          subnet_id = s.id
          key       = k
          value     = v
        }
      ]
  ]) : "${subnet_tag.subnet_id}-${subnet_tag.key}" => subnet_tag }

  resource_id = each.value.subnet_id
  key         = each.value.key
  value       = each.value.value

  depends_on = [
    aws_ram_principal_association.subnets,
    aws_ram_resource_association.subnets
  ]
}

#### Route Tables ###
data "aws_route_tables" "all" {
  vpc_id = var.vpc_id # data.aws_vpc.selected.id
}

data "aws_route_table" "all" {
  for_each       = toset(data.aws_route_tables.all.ids)
  route_table_id = each.value
}

resource "aws_ec2_tag" "route_tables" {
  provider = aws.dest
  # This loop will create a new map which contains each route table ID and its tags
  for_each = {
    for rtb_tag in flatten([
      for rtb in data.aws_route_table.all : [
        for k, v in rtb.tags : {
          rtb_id = rtb.id
          key    = k
          value  = v
        }
      ]
  ]) : "${rtb_tag.rtb_id}-${rtb_tag.key}" => rtb_tag }

  resource_id = each.value.rtb_id
  key         = each.value.key
  value       = each.value.value

  depends_on = [
    aws_ram_principal_association.subnets,
    aws_ram_resource_association.subnets
  ]
}

### Transit Gateway ###

resource "aws_ec2_tag" "tgw" {
  provider = aws.dest
  for_each = var.tgw_id != null ? data.aws_ec2_transit_gateway.selected.tags : {}

  resource_id = data.aws_ec2_transit_gateway.selected.id
  key         = each.key
  value       = each.value

  depends_on = [
    aws_ram_principal_association.tgw,
    aws_ram_resource_association.tgw
  ]
}
