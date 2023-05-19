resource "random_integer" "this" {
  max = 999999
  min = 100000
}

locals {
  azureopenai_account_name         = coalesce(var.azureopenai_account_name, "azureopenai-${random_integer.this.result}")
  azureopenai_customsubdomain_name = coalesce(var.azureopenai_customsubdomain_name, "azureopenai-${random_integer.this.result}")
  tags = var.default_tags_enabled ? {
    Application_Name = var.application_name
    Environment      = var.environment
  } : {}
}

resource "azurerm_cognitive_account" "this" {
  kind                          = "OpenAI"
  location                      = local.location
  name                          = local.azureopenai_account_name
  resource_group_name           = data.azurerm_resource_group.this.name
  sku_name                      = var.sku_name
  custom_subdomain_name         = local.azureopenai_customsubdomain_name
  public_network_access_enabled = var.public_network_access_enabled
  tags = merge(local.tags, (/*<box>*/ (var.tracing_tags_enabled ? { for k, v in /*</box>*/ {
    avm_git_commit           = "c8b6b17b0b28a2aa54a3e734b9bd0a0d0ef5c267"
    avm_git_file             = "main.tf"
    avm_git_last_modified_at = "2023-05-04 10:08:08"
    avm_git_org              = "Azure"
    avm_git_repo             = "terraform-azurerm-openai"
    avm_yor_trace            = "f2cd810e-f074-4d03-ae39-05d2902c6f79"
  } /*<box>*/ : replace(k, "avm_", var.tracing_tags_prefix) => v } : {}) /*</box>*/))
}

resource "azurerm_cognitive_deployment" "this" {
  for_each = var.deployment

  cognitive_account_id = azurerm_cognitive_account.this.id
  name                 = each.value.name
  rai_policy_name      = each.value.rai_policy_name

  model {
    format  = each.value.model_format
    name    = each.value.model_name
    version = each.value.model_version
  }
  scale {
    type = each.value.scale_type
  }
}