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
| [aws_route53_record.vpc_endpoint_alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_vpc_association_authorization.spoke_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_vpc_association_authorization) | resource |
| [aws_route53_zone.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |
| [aws_vpc_endpoint.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_route53_zone.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Name of the AWS region | `string` | `"eu-west-1"` | no |
| <a name="input_aws_service"></a> [aws\_service](#input\_aws\_service) | The acronyms of the AWS service which you want to create VPC Endpoint for | `string` | `"s3"` | no |
| <a name="input_hub_or_spoke"></a> [hub\_or\_spoke](#input\_hub\_or\_spoke) | The VPC role (Hub & Spoke Deployment). Valid values include `hub`, `spoke` | `string` | `"spoke"` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of subnets IDs which you want to deploy your VPC Endpoint. Applicable for endpoints of type Interface and GatewayLoadBalancer | `list(string)` | `null` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC | `string` | n/a | yes |
| <a name="input_vpce_tags"></a> [vpce\_tags](#input\_vpce\_tags) | Transit Gateway Attachment subnet tags | `map(string)` | <pre>{<br>  "Tier": "VPC-Endpoint-S3"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_route53_record_id"></a> [aws\_route53\_record\_id](#output\_aws\_route53\_record\_id) | The ID of the Route53 record |
| <a name="output_aws_route53_zone_arn"></a> [aws\_route53\_zone\_arn](#output\_aws\_route53\_zone\_arn) | The ARN of the Route53 Private Hosted Zone |
| <a name="output_aws_route53_zone_id"></a> [aws\_route53\_zone\_id](#output\_aws\_route53\_zone\_id) | The ID of the Route53 Private Hosted Zone |
| <a name="output_vpc_endpoint_arn"></a> [vpc\_endpoint\_arn](#output\_vpc\_endpoint\_arn) | The ARN of the VPC Endpoint |
| <a name="output_vpc_endpoint_dns"></a> [vpc\_endpoint\_dns](#output\_vpc\_endpoint\_dns) | The DNS Record of the VPC Endpoint |
| <a name="output_vpc_endpoint_eni_ids"></a> [vpc\_endpoint\_eni\_ids](#output\_vpc\_endpoint\_eni\_ids) | List of the Network Interface IDs of the VPC Endpoint |
| <a name="output_vpc_endpoint_ids"></a> [vpc\_endpoint\_ids](#output\_vpc\_endpoint\_ids) | List of IDs of the VPC Endpoints |
| <a name="output_vpc_endpoint_subnets_ids"></a> [vpc\_endpoint\_subnets\_ids](#output\_vpc\_endpoint\_subnets\_ids) | List of the Subnets IDs of the VPC Endpoint |
