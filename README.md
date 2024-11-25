<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.16.1 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.33.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.cert-manager](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_manifest.clusterissuer_cloudflare_issuer](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_namespace.cert-manager](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_secret.cloudflare_token](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cert_manager_helm_chart_version"></a> [cert\_manager\_helm\_chart\_version](#input\_cert\_manager\_helm\_chart\_version) | n/a | `string` | `"1.16.2"` | no |
| <a name="input_cert_source"></a> [cert\_source](#input\_cert\_source) | n/a | `string` | `"https://acme-v02.api.letsencrypt.org/directory"` | no |
| <a name="input_cloudflare_cluster_issuer_email"></a> [cloudflare\_cluster\_issuer\_email](#input\_cloudflare\_cluster\_issuer\_email) | n/a | `string` | n/a | yes |
| <a name="input_cloudflare_token"></a> [cloudflare\_token](#input\_cloudflare\_token) | n/a | `string` | n/a | yes |
| <a name="input_dns_zone"></a> [dns\_zone](#input\_dns\_zone) | n/a | `string` | n/a | yes |
| <a name="input_helm_repos"></a> [helm\_repos](#input\_helm\_repos) | n/a | `map(string)` | <pre>{<br/>  "cert-manager": "https://charts.jetstack.io"<br/>}</pre> | no |
| <a name="input_preferred_chain"></a> [preferred\_chain](#input\_preferred\_chain) | n/a | `string` | n/a | yes |
| <a name="input_private_key_name"></a> [private\_key\_name](#input\_private\_key\_name) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->