
resource "kubernetes_namespace" "cert-manager" {
  metadata {
    name = "cert-manager"
    labels = {
      "certmanager.k8s.io/disable-validation" = true
      "app.kubernetes.io/managed-by"          = "terraform"
    }
    annotations = {
      "certmanager.k8s.io/disable-validation" = true
    }
  }
}

resource "helm_release" "cert-manager" {
  name       = "cert-manager"
  repository = var.helm_repos.cert-manager
  chart      = "cert-manager"
  version    = var.cert_manager_helm_chart_version
  namespace  = kubernetes_namespace.cert-manager.metadata.0.name
  set {
    name  = "installCRDs"
    value = true
  }
}

resource "kubernetes_secret" "cloudflare_token" {
  metadata {
    name      = "cloudflare-api-token-secret"
    namespace = kubernetes_namespace.cert-manager.metadata.0.name
  }
  data = {
    api-token = var.cloudflare_token
  }
}

resource "kubernetes_manifest" "clusterissuer_cloudflare_issuer" {
  manifest = {
    "apiVersion" = "cert-manager.io/v1"
    "kind"       = "ClusterIssuer"
    "metadata" = {
      "name" = "cloudflare-issuer"
    }
    "spec" = {
      "acme" = {
        "email"          = var.cloudflare_cluster_issuer_email
        "preferredChain" = var.preferred_chain
        "privateKeySecretRef" = {
          "name" = "cloudflare-issuer-account-key"
        }
        "server" = var.cert_source
        "solvers" = [
          {
            "dns01" = {
              "cloudflare" = {
                "apiTokenSecretRef" = {
                  "key"  = "api-token"
                  "name" = kubernetes_secret.cloudflare_token.metadata.0.name
                }
                "email" = var.cloudflare_cluster_issuer_email
              }
            }
            "selector" = {
              "dnsZones" = [
                var.dns_zone
              ]
            }
          },
        ]
      }
    }
  }
}
