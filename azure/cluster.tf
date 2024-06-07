# Resource group containing all resources
resource "azurerm_resource_group" "qdrant-hybrid-cloud" {
  name     = "${var.prefix}-qdrant-hybrid-cloud"
  location = var.azure_location

  tags = {
    Creator = "qdrant-hybrid-cloud"
  }
}

# Azure virtual network space for quickstart resources
resource "azurerm_virtual_network" "qdrant-hybrid-cloud" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.qdrant-hybrid-cloud.location
  resource_group_name = azurerm_resource_group.qdrant-hybrid-cloud.name

  tags = {
    Creator = "qdrant-hybrid-cloud"
  }
}

# Azure internal subnet for quickstart resources
resource "azurerm_subnet" "qdrant-hybrid-cloud-internal" {
  name                 = "${var.prefix}-qdrant-hybrid-cloud-internal"
  resource_group_name  = azurerm_resource_group.qdrant-hybrid-cloud.name
  virtual_network_name = azurerm_virtual_network.qdrant-hybrid-cloud.name
  address_prefixes     = ["10.0.0.0/16"]
}

resource "azurerm_kubernetes_cluster" "qdrant-hybrid-cloud" {
  name                = "${var.prefix}-qdrant-hybrid-cloud"
  location            = azurerm_resource_group.qdrant-hybrid-cloud.location
  resource_group_name = azurerm_resource_group.qdrant-hybrid-cloud.name
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.instance_type
    upgrade_settings {
      drain_timeout_in_minutes      = 0
      max_surge                     = "10%"
      node_soak_duration_in_minutes = 0
    }
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Creator = "qdrant-hybrid-cloud"
  }
}

resource "local_file" "kubeconfig" {
  content  = azurerm_kubernetes_cluster.qdrant-hybrid-cloud.kube_config_raw
  filename = "kubeconfig"
}
