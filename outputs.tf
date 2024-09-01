output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  sensitive = true
}

output "nginx_ingress_lb_ip" {
  description = "The external IP address of the NGINX Ingress Controller Load Balancer"
  value       = kubernetes_service.nginx_ingress_controller.status[0].load_balancer[0].ingress[0].ip
}

output "nginx_ingress_lb_fqdn" {
  description = "The FQDN of the NGINX Ingress Controller Load Balancer (if available)"
  value       = kubernetes_service.nginx_ingress_controller.status[0].load_balancer[0].ingress[0].hostname
}