
variable "helm_repos" {
  type = map(string)
  default = {
    cert-manager = "https://charts.jetstack.io"
  }
}

variable "cert_manager_helm_chart_version" {
  default = "1.16.2"
}

variable "cloudflare_token" {
  type      = string
  sensitive = true
}

variable "cloudflare_cluster_issuer_email" {
  type = string
}

variable "preferred_chain" {
  type = string
}

variable "cert_source" {
  type    = string
  default = "https://acme-v02.api.letsencrypt.org/directory"
}

variable "dns_zone" {
  type = string
}

variable "private_key_name" {
  type = string
}