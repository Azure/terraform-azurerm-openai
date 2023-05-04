locals {
  private_dns_zone_id   = var.create_private_dns_zone ? azurerm_private_dns_zone.dns_zone[0].id : var.private_dns_zone_id
  private_dns_zone_name = try(azurerm_private_dns_zone.dns_zone[0].name, var.private_dns_zone.name)
}

resource "azurerm_private_endpoint" "this" {
  for_each = var.private_endpoint

  location            = data.azurerm_resource_group.pe_vnet_rg[each.key].location
  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.pe_vnet_rg[each.key].name
  subnet_id           = data.azurerm_subnet.pe_subnet[each.key].id
  tags                = local.tags

  private_service_connection {
    is_manual_connection           = each.value.is_manual_connection
    name                           = each.value.private_service_connection_name
    private_connection_resource_id = azurerm_cognitive_account.this.id
    subresource_names              = [var.pe_subresource]
  }
  dynamic "private_dns_zone_group" {
    for_each = each.value.private_dns_entry_enabled ? ["private_dns_zone_group"] : []

    content {
      name                 = local.private_dns_zone_name
      private_dns_zone_ids = [local.private_dns_zone_id]
    }
  }
}

resource "azurerm_private_dns_zone" "dns_zone" {
  count = var.private_dns_zone == null ? 1 : 0

  name                = "privatelink.openai.azure.com"
  resource_group_name = data.azurerm_resource_group.this.name
  tags                = local.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "dns_zone_link" {
  for_each = var.private_endpoint

  name                  = each.value.dns_zone_virtual_network_link
  private_dns_zone_name = local.private_dns_zone_name
  resource_group_name   = data.azurerm_resource_group.this.name
  virtual_network_id    = data.azurerm_virtual_network.vnet[each.key].id
  registration_enabled  = false
  tags                  = local.tags
}