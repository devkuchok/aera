
# Local variable for combining common and application-specific tags
locals {
  tags = merge(var.common_tags, var.application_specific_tags)
}

resource "azurerm_resource_group" "aks_rg" {
  name     = var.resource_group_name
  location = var.location
}