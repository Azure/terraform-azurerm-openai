resource "random_integer" "this" {
  max = 999999
  min = 100000
}

locals {
  account_name          = coalesce(var.account_name, "azure-openai-${random_integer.this.result}")
  custom_subdomain_name = coalesce(var.custom_subdomain_name, "azure-openai-${random_integer.this.result}")
  tags = merge(var.default_tags_enabled ? {
    Application_Name = var.application_name
    Environment      = var.environment
  } : {}, var.tags)
}

resource "azurerm_cognitive_account" "this" {
  kind                               = "OpenAI"
  location                           = local.location
  name                               = local.account_name
  resource_group_name                = data.azurerm_resource_group.this.name
  sku_name                           = var.sku_name
  custom_subdomain_name              = local.custom_subdomain_name
  dynamic_throttling_enabled         = var.dynamic_throttling_enabled
  fqdns                              = var.fqdns
  local_auth_enabled                 = var.local_auth_enabled
  outbound_network_access_restricted = var.outbound_network_access_restricted
  public_network_access_enabled      = var.public_network_access_enabled
  tags = merge(local.tags, (/*<box>*/ (var.tracing_tags_enabled ? { for k, v in /*</box>*/ {
    avm_git_commit           = "0f4ab7f7144efaef16afbc1b0e3d4b9e6ca0a29d"
    avm_git_file             = "main.tf"
    avm_git_last_modified_at = "2023-05-19 09:48:38"
    avm_git_org              = "Azure"
    avm_git_repo             = "terraform-azurerm-openai"
    avm_yor_trace            = "961e07f4-9d58-454a-8a4b-51264246afe3"
    } /*<box>*/ : replace(k, "avm_", var.tracing_tags_prefix) => v } : {}) /*</box>*/), (/*<box>*/ (var.tracing_tags_enabled ? { for k, v in /*</box>*/ {
    avm_yor_name = "this"
  } /*<box>*/ : replace(k, "avm_", var.tracing_tags_prefix) => v } : {}) /*</box>*/))

  dynamic "customer_managed_key" {
    for_each = var.customer_managed_key != null ? [var.customer_managed_key] : []

    content {
      key_vault_key_id   = customer_managed_key.value.key_vault_key_id
      identity_client_id = customer_managed_key.value.identity_client_id
    }
  }
  dynamic "identity" {
    for_each = var.identity != null ? [var.identity] : []

    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
  dynamic "network_acls" {
    for_each = var.network_acls != null ? var.network_acls : []

    content {
      default_action = network_acls.value.default_action
      ip_rules       = network_acls.value.ip_rules

      dynamic "virtual_network_rules" {
        for_each = network_acls.value.virtual_network_rules != null ? network_acls.value.virtual_network_rules : []

        content {
          subnet_id                            = virtual_network_rules.value.subnet_id
          ignore_missing_vnet_service_endpoint = virtual_network_rules.value.ignore_missing_vnet_service_endpoint
        }
      }
    }
  }
}

resource "azurerm_cognitive_deployment" "this" {
  for_each = var.deployment

  cognitive_account_id   = azurerm_cognitive_account.this.id
  name                   = each.value.name
  rai_policy_name        = each.value.rai_policy_name
  version_upgrade_option = each.value.version_upgrade_option

  model {
    format  = each.value.model_format
    name    = each.value.model_name
    version = each.value.model_version
  }
  scale {
    type     = each.value.scale_type
    capacity = try(each.value.capacity, 1)
  }
}
