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
| [aws_ec2_transit_gateway.tgw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway) | resource |
| [aws_ec2_transit_gateway_route_table.hub](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route_table) | resource |
| [aws_ec2_transit_gateway_route_table.spoke](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route_table) | resource |
| [aws_ram_principal_association.tgw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ram_principal_association) | resource |
| [aws_ram_resource_association.tgw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ram_resource_association) | resource |
| [aws_ram_resource_share.tgw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ram_resource_share) | resource |
| [aws_organizations_organization.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_hub_rt_tags"></a> [hub\_rt\_tags](#input\_hub\_rt\_tags) | Transit Gateway Route Table tags | `map(string)` | <pre>{<br>  "Name": "hub_rt"<br>}</pre> | no |
| <a name="input_spoke_rt_tags"></a> [spoke\_rt\_tags](#input\_spoke\_rt\_tags) | Transit Gateway Route Table tags | `map(string)` | <pre>{<br>  "Name": "spoke_rt"<br>}</pre> | no |
| <a name="input_tgw_name"></a> [tgw\_name](#input\_tgw\_name) | The name of the Transit Gateway | `string` | `null` | no |
| <a name="input_tgw_tags"></a> [tgw\_tags](#input\_tgw\_tags) | Transit gateway tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the Transit Gateway |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Transit Gateway |
| <a name="output_tgw_hub_route_table_arn"></a> [tgw\_hub\_route\_table\_arn](#output\_tgw\_hub\_route\_table\_arn) | The ARN of the Hub Route Table |
| <a name="output_tgw_hub_route_table_id"></a> [tgw\_hub\_route\_table\_id](#output\_tgw\_hub\_route\_table\_id) | The ID of the Hub Route Table |
| <a name="output_tgw_ram_resource_share_arn"></a> [tgw\_ram\_resource\_share\_arn](#output\_tgw\_ram\_resource\_share\_arn) | The ARN of the TGW RAM share |
| <a name="output_tgw_ram_resource_share_id"></a> [tgw\_ram\_resource\_share\_id](#output\_tgw\_ram\_resource\_share\_id) | The ID of the TGW RAM share |
| <a name="output_tgw_spoke_route_table_arn"></a> [tgw\_spoke\_route\_table\_arn](#output\_tgw\_spoke\_route\_table\_arn) | The ARN of the Spoke Route Table |
| <a name="output_tgw_spoke_route_table_id"></a> [tgw\_spoke\_route\_table\_id](#output\_tgw\_spoke\_route\_table\_id) | The ID of the Spoke Route Table |
