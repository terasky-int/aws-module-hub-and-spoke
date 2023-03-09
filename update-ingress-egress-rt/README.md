<!-- BEGIN_TF_DOCS -->
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
| [aws_route.private_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.public_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_private_rt_ids"></a> [private\_rt\_ids](#input\_private\_rt\_ids) | List of the Private Route Table IDs | `list(string)` | n/a | yes |
| <a name="input_public_rt_ids"></a> [public\_rt\_ids](#input\_public\_rt\_ids) | List of the Public Route Table IDs | `list(string)` | n/a | yes |
| <a name="input_tgw_id"></a> [tgw\_id](#input\_tgw\_id) | The id of the TGW | `string` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | The VPC CIDR Block in order to add it to the Route Table | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->