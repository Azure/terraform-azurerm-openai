module "openai" {
  source                        = "../.."
  resource_group_name           = azurerm_resource_group.this.name
  location                      = azurerm_resource_group.this.location
  public_network_access_enabled = true
  deployment = {
    "gpt-35-turbo" = {
      name          = "gpt-35-turbo"
      model_format  = "OpenAI"
      model_name    = "gpt-35-turbo"
      model_version = "0301"
      scale_type    = "Standard"
    },
  }
  diagnostic_settings = {
    "aoai-svc-diag" = {
      name                           = "aoai-svc-diag"
      log_analytics_workspace_id     = azurerm_log_analytics_workspace.this.id
      log_analytics_destination_type = "AzureDiagnostics"

      audit_log_retention_policy = {
        enabled = true
        days    = 30
      }
      request_response_log_retention_policy = {
        enabled = false
        days    = 30
      }
      trace_log_retention_policy = {
        enabled = false
        days    = 30
      }
      metric_retention_policy = {
        enabled = false
        days    = 30
      }
    }
  }
  depends_on = [
    azurerm_resource_group.this
  ]
}
