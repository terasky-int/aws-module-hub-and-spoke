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
| [aws_route.inspection_private_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.inspection_public_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.inspection_tgw_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.inspection_tgw_rt_add_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gwlb_endpoint_ids"></a> [gwlb\_endpoint\_ids](#input\_gwlb\_endpoint\_ids) | List of the Gateway Load Balancer VPC Endpoints IDs | `list(string)` | n/a | yes |
| <a name="input_inspection_private_rt_ids"></a> [inspection\_private\_rt\_ids](#input\_inspection\_private\_rt\_ids) | List of the Inspection VPC Private Route Table IDs | `list(string)` | n/a | yes |
| <a name="input_inspection_public_cidrs"></a> [inspection\_public\_cidrs](#input\_inspection\_public\_cidrs) | list of inspection public cidrs blocks | `list(string)` | `[]` | no |
| <a name="input_inspection_public_rt_ids"></a> [inspection\_public\_rt\_ids](#input\_inspection\_public\_rt\_ids) | List of the Inspection VPC Public Route Table IDs | `list(string)` | n/a | yes |
| <a name="input_inspection_tgw_rt_ids"></a> [inspection\_tgw\_rt\_ids](#input\_inspection\_tgw\_rt\_ids) | List of the Inspection VPC TGW Route Table IDs | `list(string)` | `[]` | no |
| <a name="input_is_inspection"></a> [is\_inspection](#input\_is\_inspection) | Whether or not the caller module is on creation of the Inspection VPC | `bool` | `false` | no |
| <a name="input_tgw_id"></a> [tgw\_id](#input\_tgw\_id) | The id of the TGW | `string` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | The VPC CIDR Block in order to add it to the Route Table | `string` | n/a | yes |

## Outputs

No outputs.
