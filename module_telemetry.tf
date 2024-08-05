data "azurerm_client_config" "telemetry" {}

data "modtm_module_source" "telemetry" {
  module_path = path.module
}

resource "modtm_telemetry" "this" {
  tags = {
    subscription_id = data.azurerm_client_config.telemetry.subscription_id
    tenant_id       = data.azurerm_client_config.telemetry.tenant_id
    module_source   = data.modtm_module_source.telemetry.module_source
    module_version  = data.modtm_module_source.telemetry.module_version
  }
}