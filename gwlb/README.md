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
| [aws_lb.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_route.tgw_attachment_rt_all_to_vpce](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_vpc_endpoint.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint_connection_accepter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint_connection_accepter) | resource |
| [aws_vpc_endpoint_service.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint_service) | resource |
| [aws_vpc_endpoint_subnet_association.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint_subnet_association) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_endpoint_service_tags"></a> [endpoint\_service\_tags](#input\_endpoint\_service\_tags) | Public subnet tags | `map(string)` | `{}` | no |
| <a name="input_gwlb_name"></a> [gwlb\_name](#input\_gwlb\_name) | The name of the Gateway Load Balancer | `string` | n/a | yes |
| <a name="input_gwlb_tags"></a> [gwlb\_tags](#input\_gwlb\_tags) | Public subnet tags | `map(string)` | `{}` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | List of IDs of private subnets | `list(string)` | n/a | yes |
| <a name="input_tgw_route_table_ids"></a> [tgw\_route\_table\_ids](#input\_tgw\_route\_table\_ids) | List of TGW Attachments' Route Tables IDs | `list(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC where you want to deploy the Gateway Load Balancer | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | The name of the VPC where you want to deploy the Gateway Load Balancer | `string` | `"Inspection"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gwlb_arn"></a> [gwlb\_arn](#output\_gwlb\_arn) | The ID of the Gateway Load Balancer |
| <a name="output_gwlb_id"></a> [gwlb\_id](#output\_gwlb\_id) | The ID of the Gateway Load Balancer |
| <a name="output_gwlb_vpc_endpoint_arns"></a> [gwlb\_vpc\_endpoint\_arns](#output\_gwlb\_vpc\_endpoint\_arns) | List of ARNs of the GWLB VPC Endpoint |
| <a name="output_gwlb_vpc_endpoint_ids"></a> [gwlb\_vpc\_endpoint\_ids](#output\_gwlb\_vpc\_endpoint\_ids) | List of IDs of the GWLB VPC Endpoint |
| <a name="output_gwlb_vpc_endpoint_service_arn"></a> [gwlb\_vpc\_endpoint\_service\_arn](#output\_gwlb\_vpc\_endpoint\_service\_arn) | The ARN of the Gateway Load Balancer VPC Endpoint Service |
| <a name="output_gwlb_vpc_endpoint_service_id"></a> [gwlb\_vpc\_endpoint\_service\_id](#output\_gwlb\_vpc\_endpoint\_service\_id) | The ID of the Gateway Load Balancer VPC Endpoint Service |
| <a name="output_gwlb_vpc_endpoint_service_name"></a> [gwlb\_vpc\_endpoint\_service\_name](#output\_gwlb\_vpc\_endpoint\_service\_name) | The Name of the Gateway Load Balancer VPC Endpoint Service |
