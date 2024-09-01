variable "vnet_name" {
  description = "The name of the Virtual Network."
  type        = string
  default     = "aks-vnet"
}

variable "vnet_cidr" {
  description = "The CIDR block for the Virtual Network."
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_name" {
  description = "The name of the Subnet."
  type        = string
  default     = "aks-subnet"
}

variable "subnet_cidr" {
  description = "The CIDR block for the Subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "network_security_group_name" {
  description = "The name of the Network Security Group."
  type        = string
  default     = "aks-nsg"
}

variable "subscription_id" {
  description = "The Azure Subscription ID"
  type        = string
}

variable "common_tags" {
  description = "A map of common tags to apply to all resources."
  type        = map(string)
  default     = {
    environment = "dev"
    managed_by  = "terraform"
  }
}

variable "application_specific_tags" {
  description = "A map of application-specific tags."
  type        = map(string)
  default     = {
    app = "print-ipv4"
  }
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default     = "aks-resource-group"
}

variable "location" {
  description = "The Azure region where the resources will be deployed."
  type        = string
  default     = "East US"
}

variable "cluster_name" {
  description = "The name of the AKS cluster."
  type        = string
  default     = "aks-cluster"
}

variable "namespace" {
  description = "The Kubernetes namespace where the application will be deployed."
  type        = string
  default     = "default"
}

variable "vm_size" {
  description = "The size of the Virtual Machine."
  type        = string
  default     = "Standard_DC1s_v2"
}
variable "node_count" {
  description = "The number of nodes in the AKS cluster."
  type        = number
  default     = 2
  
}