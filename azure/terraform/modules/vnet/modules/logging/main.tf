resource "azurerm_storage_account" "network_log_data" {
  name                = "randomnameskaf2"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location

  account_tier             = "Standard"
  account_replication_type = "GRS"
  min_tls_version          = "TLS1_2"
  tags                     = var.tags
}

resource "azurerm_log_analytics_workspace" "traffic_analytics" {
  name                = format("%s-%s-analytics-workspace", var.environment, var.name)
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  retention_in_days   = 90
  daily_quota_gb      = 10
  tags                = var.tags
}

# The Network Watcher Instance & network log flow
# There can only be one Network Watcher per subscription and region

resource "azurerm_network_watcher" "app1_traffic" {
  name                = format("%s-%s-network-watcher", var.environment, var.name)
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_network_watcher_flow_log" "app1_network_logs" {
  name                 = format("%s-%s-network-watcher-flow-log", var.environment, var.name)
  network_watcher_name = azurerm_network_watcher.app1_traffic.name
  resource_group_name  = azurerm_network_watcher.app1_traffic.resource_group_name

  network_security_group_id = var.network_security_group_id
  storage_account_id        = azurerm_storage_account.network_log_data.id
  enabled                   = true

  retention_policy {
    enabled = true
    days    = 90
  }

  traffic_analytics {
    enabled               = true
    workspace_id          = azurerm_log_analytics_workspace.traffic_analytics.workspace_id
    workspace_region      = azurerm_log_analytics_workspace.traffic_analytics.location
    workspace_resource_id = azurerm_log_analytics_workspace.traffic_analytics.id
    interval_in_minutes   = 10
  }
  tags = var.tags
}