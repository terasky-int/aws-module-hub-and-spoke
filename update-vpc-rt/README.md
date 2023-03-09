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
| [aws_route.private_rt_all_to_tgw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.tgw_attach_rt_all_to_tgw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_private_route_table_ids"></a> [private\_route\_table\_ids](#input\_private\_route\_table\_ids) | List of Private Route Tables IDs | `list(string)` | n/a | yes |
| <a name="input_tgw_id"></a> [tgw\_id](#input\_tgw\_id) | The ID of the Transit Gateway | `string` | n/a | yes |
| <a name="input_tgw_route_table_ids"></a> [tgw\_route\_table\_ids](#input\_tgw\_route\_table\_ids) | List of TGW Attachments Route Tables IDs | `list(string)` | n/a | yes |

## Outputs

No outputs.
