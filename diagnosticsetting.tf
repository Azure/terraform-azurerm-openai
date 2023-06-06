resource "azurerm_monitor_diagnostic_setting" "setting" {
  for_each                       = var.diagnostic_setting

  name                           = each.value.name
  target_resource_id             = azurerm_cognitive_account.this.id
  log_analytics_workspace_id     = each.value.log_analytics_workspace_id
  log_analytics_destination_type = each.value.log_analytics_destination_type
  eventhub_name                  = each.value.eventhub_name
  eventhub_authorization_rule_id = each.value.eventhub_authorization_rule_id
  storage_account_id             = each.value.storage_account_id
  partner_solution_id            = each.value.partner_solution_id

  enabled_log {
    category = "Audit"

    retention_policy {
      enabled = each.value.retention_policy_enabled
      days    = each.value.retention_policy_days
    }
  }

  enabled_log {
    category = "RequestResponse"

    retention_policy {
      enabled = each.value.retention_policy_enabled
      days    = each.value.retention_policy_days
    }
  }

  enabled_log {
    category = "Trace"

    retention_policy {
      enabled = each.value.retention_policy_enabled
      days    = each.value.retention_policy_days
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = each.value.retention_policy_enabled
      days    = each.value.retention_policy_days
    }
  }
}