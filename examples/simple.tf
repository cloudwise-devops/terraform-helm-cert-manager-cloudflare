
data "google_secret_manager_secret_version" "cloudflare_token" {
  secret = "cloudflare_token"
}

module "cert-manager-cloudflare" {
  source                          = "cloudwise-devops/cert-manager-cloudflare/helm"
  version                         = "1.0.1"
  cloudflare_token                = data.google_secret_manager_secret_version.cloudflare_token.secret_data
  cloudflare_cluster_issuer_email = "john@doe.com"
  preferred_chain                 = "root chain"
  dns_zone                        = "example.com"
}