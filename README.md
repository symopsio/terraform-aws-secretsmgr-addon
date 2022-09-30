# secretsmgr-addon

The `secretsmgr-addon` module adds AWS Secrets Manager access to a Sym runtime connector module.

This `Addon` will add a policy to the role generated by a `Connector`.

You typically include this `Addon` by adding `aws/secretsmgr` to the  `addons` property of the runtime  connector module, rather than referring to the policy ARN itself.

Secrets must be tagged with `${var.tag_name}=${var.environment}` in order to be accessible by this addon.

```hcl
module "runtime_connector" {
  source  = "symopsio/runtime-connector/aws"
  version = ">= 1.0.0"

  addons      = [ "aws/secretsmgr" ]
  environment = "sandbox"
}
```

Optionally override the default tag_name and value with `addon_params`:

```hcl
module "runtime_connector" {
  source  = "symopsio/runtime-connector/aws"
  version = ">= 1.0.0"

  addons      = [ "aws/secretsmgr" ]
  environment = "sandbox"

  // Optionally override the default tag_name and value with `addon_params`
  addon_params = {
    "aws/secretsmgr" = {
       "tag_name" = "CustomName",
       "tag_value = "CustomValue"
    }
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | An environment qualifier for the resources this module creates, to support a Terraform SDLC. The environment value is also the tag value that secrets must be tagged with to be accessible by this addon. | `string` | n/a | yes |
| <a name="input_tag_name"></a> [tag\_name](#input\_tag\_name) | Name of the tag that secrets must be tagged with to be accessible by this addon. | `string` | `"SymEnv"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags to apply to resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy_arn"></a> [policy\_arn](#output\_policy\_arn) | Secrets access policy arn |
<!-- END_TF_DOCS -->