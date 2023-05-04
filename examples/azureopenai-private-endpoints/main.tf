module "openai" {
  source                  = "../.."
  resource_group_name     = azurerm_resource_group.this.name
  location                = azurerm_resource_group.this.location
  create_private_dns_zone = true
  private_endpoint = {
    "pe_endpoint" = {
      private_dns_entry_enabled       = true
      dns_zone_rg_name                = azurerm_resource_group.this.name
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
    "text-curie-001" = {
      name          = "text-curie-001"
      model_format  = "OpenAI"
      model_name    = "text-curie-001"
      model_version = "1"
      scale_type    = "Standard"
    },
    "text-search-curie-query-001" = {
      name          = "text-search-curie-query-001"
      model_format  = "OpenAI"
      model_name    = "text-search-curie-query-001"
      model_version = "1"
      scale_type    = "Standard"
    },
  }
  depends_on = [
    azurerm_resource_group.this,
    module.vnet
  ]
}