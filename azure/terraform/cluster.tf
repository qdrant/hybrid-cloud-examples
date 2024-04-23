
# There are two types of managed idetities "System assigned" & "UserAssigned". User-assigned managed identities can be used on multiple resources.
resource "azurerm_user_assigned_identity" "identity" {
  name                = "aksidentity"
  resource_group_name = azurerm_resource_group.terraform_infra.name
  location            = azurerm_resource_group.terraform_infra.location
}

module "aks_cluster" {
  source     = "squareops/aks/azurerm"

  name                              = format("%s-aks", var.cluster_name)
  environment                       = var.environment
  kubernetes_version                = var.kubernetes_version
  create_resource_group             = false                                       # Enable if you want to a create resource group for AKS cluster.
  existing_resource_group_name      = azurerm_resource_group.terraform_infra.name # We will be using resource group create earlier.
  resource_group_location           = azurerm_resource_group.terraform_infra.location
  user_assigned_identity_id         = azurerm_user_assigned_identity.identity.id
  principal_id                      = azurerm_user_assigned_identity.identity.principal_id
  network_plugin                    = var.network_plugin
  default_agent_pool_name           = "addons"
  default_agent_pool_count          = "1"
  default_agent_pool_size           = "Standard_DS2_v2"
  default_node_labels               = { Addon-Services = "true" }
  os_disk_size_gb                   = 30
  auto_scaling_enabled              = true
  agents_min_count                  = 1
  agents_max_count                  = 2
  node_public_ip_enabled            = false           # If we want to create public nodes set this value "true"
  agents_availability_zones         = ["1", "2", "3"] # Does not applies to all regions please verify the availablity zones for the respective region.
  rbac_enabled                      = true
  net_profile_pod_cidr              = var.pod_cidr
  net_profile_service_cidr          = var.service_cidr
  net_profile_docker_bridge_cidr    = "172.17.0.1/16"
  net_profile_dns_service_ip        = var.dns_service_ip
  open_service_mesh_enabled         = false # Add on for the open service mesh (istio)
  sku_tier                          = "Free"
  subnet_id                         = module.vnet.private_subnets
  admin_username                    = "azureuser" # node pool username
  public_ssh_key                    = var.public_ssh_key
  agents_type                       = "VirtualMachineScaleSets"                                                     # Creates an Agent Pool backed by a Virtual Machine Scale Set.
  net_profile_outbound_type         = "loadBalancer"                                                                # The outbound (egress) routing method which should be used for this Kubernetes Cluster. Possible values are loadBalancer and userDefinedRouting. Defaults to loadBalancer.
  log_analytics_workspace_sku       = "PerGB2018"                                                                   # refer https://azure.microsoft.com/pricing/details/monitor/ for log analytics pricing
  log_analytics_solution_enabled    = true                                                                          # Log analytics solutions are typically software solutions with data visualization and insights tools.
  control_plane_logs_scrape_enabled = true                                                                          # Scrapes logs of the aks control plane
  control_plane_monitor_name        = format("%s-%s-aks-control-plane-logs-monitor", var.cluster_name, var.environment) # Control plane logs monitoring such as "kube-apiserver", "cloud-controller-manager", "kube-scheduler"
  additional_tags                   = var.tags
}

module "aks_managed_node_pool" {
  depends_on = [module.aks_cluster]
  source     = "squareops/aks/azurerm//modules/managed_node_pools"

  resource_group_name   = azurerm_resource_group.terraform_infra.name
  orchestrator_version  = var.cluster_name
  location              = azurerm_resource_group.terraform_infra.location
  vnet_subnet_id        = module.vnet.private_subnets
  kubernetes_cluster_id = module.aks_cluster.kubernetes_cluster_id
  node_pools = {
    app = {
      vm_size                  = "Standard_DS2_v2"
      auto_scaling_enabled     = true
      os_disk_size_gb          = 50
      os_disk_type             = "Managed"
      node_count               = var.node_count
      min_count                = var.min_nodes
      max_count                = var.max_nodes
      availability_zones       = ["1", "2", "3"]
      enable_node_public_ip    = false # if set to true node_public_ip_prefix_id is required
      node_public_ip_prefix_id = ""
      node_labels              = { App-service = "true" }
      node_taints              = [""]
      host_encryption_enabled  = false
      max_pods                 = 30
      agents_tags              = var.tags
    },
  }
}