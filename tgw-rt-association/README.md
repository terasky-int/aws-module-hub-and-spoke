## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ec2_transit_gateway_route.all_to_inspection_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route) | resource |
| [aws_ec2_transit_gateway_route.spoke_vpc_cidr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route) | resource |
| [aws_ec2_transit_gateway_route_table_association.hub_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route_table_association) | resource |
| [aws_ec2_transit_gateway_route_table_association.spoke_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route_table_association) | resource |
| [aws_ec2_transit_gateway_vpc_attachment_accepter.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_vpc_attachment_accepter) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_is_inspection"></a> [is\_inspection](#input\_is\_inspection) | Whether this VPC contains a Firewall or not. Should be true if the VPC contains a Firewall | `bool` | `false` | no |
| <a name="input_tgw_accept"></a> [tgw\_accept](#input\_tgw\_accept) | Whether to accept the TGW Attachment request. If the request is from the same account it accepts automatically, should be true if it from different account than the tgw | `bool` | `true` | no |
| <a name="input_tgw_attch_id"></a> [tgw\_attch\_id](#input\_tgw\_attch\_id) | The id of the Transit Gateway Attachment | `string` | n/a | yes |
| <a name="input_tgw_hub_route_table_id"></a> [tgw\_hub\_route\_table\_id](#input\_tgw\_hub\_route\_table\_id) | The id of the TGW Route Table of the VPC that contain a Firewall | `string` | n/a | yes |
| <a name="input_tgw_spoke_route_table_id"></a> [tgw\_spoke\_route\_table\_id](#input\_tgw\_spoke\_route\_table\_id) | The id of the TGW Route Table of all VPCs that don't contain a Firewall | `string` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | The VPC CIDR Block in order to add it to the Route Table | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | The VPC name | `string` | n/a | yes |

## Outputs

No outputs.
