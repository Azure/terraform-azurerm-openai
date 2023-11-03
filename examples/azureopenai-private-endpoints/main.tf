module "openai" {
  source              = "../.."
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  private_endpoint = {
    "pe_endpoint" = {
      private_dns_entry_enabled       = true
      dns_zone_virtual_network_link   = "dns_zone_link"
      is_manual_connection            = false
      name                            = "pe_one"
      private_service_connection_name = "pe_one_connection"
      subnet_name                     = "subnet0"
      vnet_name                       = module.vnet.vnet_name
      vnet_rg_name                    = azurerm_resource_group.this.name
    }
  }
  deployment = {
    "text-embedding-ada-002" = {
      name          = "text-embedding-ada-002"
      model_format  = "OpenAI"
      model_name    = "text-embedding-ada-002"
      model_version = "2"
      scale_type    = "Standard"
    }
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
  network_acls = [{
    default_action = "Deny",
    ip_rules       = ["00.00.00.00"]
    virtual_network_rules = [{
      subnet_id                            = lookup(module.vnet.vnet_subnets_name_id, "subnet0")
      ignore_missing_vnet_service_endpoint = false
    }]
  }]
  depends_on = [
    azurerm_resource_group.this,
    module.vnet
  ]
}