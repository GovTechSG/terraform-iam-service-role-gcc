# iam-service-role-gcc

Creates a service role allowing assume role by aws services without access keys

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| attach\_policies | map(string) of existing policies to attach | `map(string)` | `{}` | no |
| aws\_region | aws region | `string` | n/a | yes |
| base\_policy | Base policy of trust relationship for assuming this role | `string` | n/a | yes |
| custom\_policy | custom policy to be applied to role using the EOF syntax | `string` | `""` | no |
| description | description of the role | `string` | n/a | yes |
| name | name of the role in aws console | `string` | n/a | yes |
| path | path of the role in aws console | `string` | `"/"` | no |
| tags | Tags for resources | `map(string)` | <pre>{<br>  "Terraform": "True"<br>}</pre> | no |
| enable\_gcci\_boundary | permission boundary toggle | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| policy | Policy attached to the role. |
| role | The IAM role |

