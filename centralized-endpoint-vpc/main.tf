###########
# Hub
###########

resource "aws_vpc_endpoint" "this" {
  count = var.hub_or_spoke == "hub" ? 1 : 0

  vpc_id            = var.vpc_id #module.vpc.vpc_id
  vpc_endpoint_type = "Interface"
  subnet_ids        = var.subnet_ids
  service_name      = "com.amazonaws.${var.aws_region}.${var.aws_service}"
  # private_dns_enabled should be `false` if you want a centralized Endpoint-VPC
  private_dns_enabled = false

  tags = var.vpce_tags
}

resource "aws_route53_zone" "private" {
  count = var.hub_or_spoke == "hub" ? 1 : 0

  name = "com.amazonaws.${var.aws_region}.${var.aws_service}"

  vpc {
    vpc_id = var.vpc_id #module.vpc.vpc_id
  }

  # Prevent the deletion of associated VPCs after
  # the initial creation. See documentation on
  # aws_route53_zone_association for details
  lifecycle {
    ignore_changes = [vpc]
  }
}

resource "aws_route53_record" "vpc_endpoint_alias" {
  count = var.hub_or_spoke == "hub" ? 1 : 0

  zone_id = aws_route53_zone.private[count.index].zone_id
  name    = ""
  type    = "A"

  alias {
    evaluate_target_health = false
    name                   = aws_vpc_endpoint.this[count.index].dns_entry[count.index]["dns_name"]
    zone_id                = aws_vpc_endpoint.this[count.index].dns_entry[count.index]["hosted_zone_id"]
  }

  lifecycle {
    ignore_changes = [alias]
  }
}

###########
# Spoke
###########

data "aws_route53_zone" "selected" {
  count = var.hub_or_spoke == "spoke" ? 1 : 0
  #  provider = aws.remote

  name         = "com.amazonaws.${var.aws_region}.${var.aws_service}"
  private_zone = true
}

resource "aws_route53_vpc_association_authorization" "spoke_vpc" {
  count = var.hub_or_spoke == "spoke" ? 1 : 0

  vpc_id  = var.vpc_id
  zone_id = data.aws_route53_zone.selected[count.index].id

    lifecycle {
    ignore_changes = [id]
  }
}
## can't complete the vpc association because module cannot contain provider.tf
#resource "aws_route53_zone_association" "spoke_vpc" {
#  count = var.hub_or_spoke == "spoke" ? 1 : 0
#  #  provider = aws.remote
#
#  zone_id = data.aws_route53_zone.selected[count.index].id
#  vpc_id  = var.vpc_id #module.vpc.vpc_id
#}