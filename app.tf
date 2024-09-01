
resource "kubernetes_namespace" "namespace" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_deployment" "print_ipv4" {
  metadata {
    name      = "print-ipv4"
    namespace = kubernetes_namespace.namespace.metadata[0].name
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "print-ipv4"
      }
    }
    template {
      metadata {
        labels = {
          app = "print-ipv4"
        }
      }
      spec {
        container {
          image = "<acr_name>.azurecr.io/print-ipv4:1.0"
          name  = "print-ipv4"
        }
      }
    }
  }
}
