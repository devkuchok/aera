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

resource "kubernetes_service" "print_ipv4_service" {
  metadata {
    name      = "print-ipv4"
    namespace = kubernetes_namespace.namespace.metadata[0].name
  }
  spec {
    selector = {
      app = "print-ipv4"
    }
    ports {
      port        = 80
      target_port = 80
    }
  }
}

resource "kubernetes_ingress" "print_ipv4_ingress" {
  metadata {
    name      = "print-ipv4-ingress"
    namespace = kubernetes_namespace.namespace.metadata[0].name
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }

  spec {
    rule {
      http {
        path {
          path = "/"
          backend {
            service {
              name = kubernetes_service.print_ipv4_service.metadata[0].name
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}